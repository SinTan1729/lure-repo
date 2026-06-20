#!/usr/bin/env python3

# This is a script to update checksums for sources in lure build scripts
# This is a crude analog for updpkgsums for PKGBUILD files
# The script assumed that matching sources* and checksums* lines are already there
# --force will always update the checksums

import os
import tempfile
import sys
import platform
import requests
import hashlib
from collections import Counter

# Global variables
force: bool = False
name: str | None = None
old_version: str | None = None
git_repo: str | None = None
architectures: list[str] = []
sources: dict[str, list[str]] = {}
checksums: dict[str, list[str]] = {}
sys_arch: str


def unquote(s: str) -> str:
    if s.startswith("'") and s.endswith("'"):
        s = s[1:-1]
    if s.startswith('"') and s.endswith('"'):
        s = s[1:-1]
    return s


def expand_vars(s: str, source: str, version: str) -> str:
    if name is not None:
        s = s.replace("${name}", name)
        s = s.replace("$name", name)
    if version is not None:
        s = s.replace("${version}", version)
        s = s.replace("$version", version)
    if git_repo is not None:
        s = s.replace("${git_repo}", git_repo)
        s = s.replace("$git_repo", git_repo)
    if source == "any":
        source = sys_arch
    s = s.replace("${ARCH}", source)
    s = s.replace("$ARCH", source)

    if "$" in s:
        raise IndexError(f"Unable to expand all vars in: {s}")
    return s


def read_args(args):
    global force, sys_arch
    if "--force" in args:
        force = True

    sys_arch = platform.machine().lower()
    if sys_arch == "x86_64":
        sys_arch = "amd64"


def read_vars():
    global name, old_version, git_repo, sources, checksums
    with open("lure.sh") as f:
        while line := f.readline():
            line = line.rstrip("\n").strip()
            if "=" not in line:
                continue

            var, val = line.split("=", 1)
            match var:
                case "name":
                    name = unquote(val)
                case "version":
                    old_version = unquote(val)
                case "git_repo":
                    git_repo = unquote(val)
                    continue
                case "architectures":
                    for item in val.strip()[1:-1].split("'"):
                        if item.strip():
                            architectures.append(item)

            if not var.startswith(("sources", "checksums")):
                continue

            try:
                entry, arch = var.split("_", 1)
            except ValueError:
                entry, arch = var, "any"
            values: list[str] = []
            if ")" in line:
                values.append(unquote(line.split("(", 1)[1].rstrip(")")))
            else:
                while True:
                    line = f.readline()
                    if line.startswith(")"):
                        break
                    values.append(unquote(line.rstrip("\n").strip()))

            if entry == "sources":
                sources[arch] = values
            elif entry == "checksums":
                checksums[arch] = values


def safe_get(ses: requests.Session, url: str) -> dict:
    req = ses.get(url)
    req.raise_for_status()
    return req.json()


def get_latest_version(ses: requests.Session) -> str:
    if git_repo is None:
        sys.exit("Unable to get latest version. No github repo provided!")
    vers: str | None = safe_get(
        ses, f"https://api.github.com/repos/{git_repo}/releases/latest"
    ).get("tag_name")
    if vers is not None and vers.startswith("v"):
        vers = vers[1:]
    if vers is None:
        sys.exit("Unable to get latest version. No github repo provided!")
    return vers


def get_source_checksum(ses: requests.Session, url: str, source: str, version: str) -> str:
    url = expand_vars(url, source, version)
    if "github.com" in url and "/releases/download" in url:
        _, _, _, owner, repo, _, _, tag, filename = url.split("/")
        return next(
            a["digest"].split("sha256:", 1)[1]
            for a in ses.get(
                f"https://api.github.com/repos/{owner}/{repo}/releases/tags/{tag}"
            ).json()["assets"]
            if a["name"] == filename
        )

    r = ses.get(url, stream=True, timeout=30)
    r.raise_for_status()
    sha256 = hashlib.sha256()
    for chunk in r.iter_content(chunk_size=8192):
        if chunk:
            sha256.update(chunk)
    return sha256.hexdigest()


def write_file(target_version):
    with tempfile.NamedTemporaryFile("w", delete=False, dir=".") as out:
        with open("lure.sh") as f:
            while line := f.readline():
                if line.startswith("version="):
                    out.write(f"version={target_version}\n")
                elif line.startswith("checksums"):
                    prefix = line.split("=", 1)[0]
                    try:
                        arch = prefix.split("_", 1)[1]
                        suffix = "_" + arch
                    except IndexError:
                        arch = "any"
                        suffix = ""
                    if len(checksums[arch]) == 1:
                        out.write(f"checksums{suffix}=('{checksums[arch][0]}')\n")
                    else:
                        out.write(f"checksums{suffix}=(\n")
                        for checksum in checksums[arch]:
                            out.write(f"    '{checksum}'\n")
                        out.write(")\n")
                        while not line.startswith(")"):
                            line = f.readline()
                else:
                    out.write(line)
    os.replace(out.name, "lure.sh")


def main(args: list[str]):
    read_args(args)
    read_vars()

    if name is None:
        raise ValueError("No name found!")
    print(f"Procesing {name}...")
    if old_version is None:
        raise ValueError("No version found!")
    print(f"Detected version: {old_version}")
    if list(map(lambda k: len(sources[k]), sources)) != list(
        map(lambda k: len(checksums[k]), checksums) or sources.keys() != checksums.keys()
    ):
        raise ValueError("Sources and checksums are not one-to-one!")
    if not sources:
        print("No sources to update.")
        sys.exit()
    if len(Counter(architectures)) != len(architectures):
        raise ValueError("Repeated value in architectures!")
    if Counter(architectures) != Counter(sources.keys()) and not (
        len(sources) == 1 and len(architectures) == 1 and list(sources)[0] == "any"
    ):
        raise ValueError("Sources and architectures are not one-to-one!")

    session = requests.session()
    target_version = get_latest_version(session)
    if old_version == target_version and not force:
        print("Package is up-to-date.")
        sys.exit()
    elif not force:
        print("Update available.")
        print(f"{name}: {old_version} -> {target_version}")

    for source in sources.keys():
        for i, item in enumerate(sources[source]):
            if checksums[source][i] == "SKIP":
                continue
            checksum = get_source_checksum(session, item, source, target_version)
            checksums[source][i] = checksum

    write_file(target_version)
    print("Updated package.")


if __name__ == "__main__":
    main(sys.argv)
