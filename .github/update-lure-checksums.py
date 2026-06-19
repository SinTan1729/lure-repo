#!/bin/env python3

# This is a script to update checksums for sources in lure build scripts
# This is a crude analog for updpkgsums for PKGBUILD files
# The script assumed that matching sources* and checksums* lines are already there

import os
import sys
import re
import time
import requests
import hashlib
import platform

session = requests.Session()


def get_file_checksum(url: str) -> str:
    if "github.com" in url and "/releases/download" in url:
        _, _, _, owner, repo, _, _, tag, filename = url.split("/")
        return next(
            a["digest"].split("sha256:", 2)[1]
            for a in requests.get(
                f"https://api.github.com/repos/{owner}/{repo}/releases/tags/{tag}"
            ).json()["assets"]
            if a["name"] == filename
        )

    r = session.get(url, stream=True, timeout=30)
    r.raise_for_status()

    sha256 = hashlib.sha256()

    for chunk in r.iter_content(chunk_size=8192):
        if chunk:
            sha256.update(chunk)

    return sha256.hexdigest()


# Check if the build script exists
if not os.path.isfile("lure.sh"):
    print("Couldn't find a lure.sh file in the current directory.")
    exit(1)

with open("lure.sh", "r") as script_file:
    script = script_file.readlines()

vars = {}
multiline_var = None
for line in script:
    if multiline_var is None and not line.startswith(
        ("name=", "version=", "git_repo=", "sources", "checksums")
    ):
        continue
    if line.startswith(")"):
        multiline_var = None
        continue
    if multiline_var is not None:
        vars[multiline_var] = f"{vars[multiline_var]} {line.strip()}"
        continue
    if line.startswith(("sources_", "checksums_")) and line.strip("\n").endswith("("):
        multiline_var = line.split("=", 2)[0]
        vars[multiline_var] = ""
    else:
        multiline_var = None
        var, val = line.strip("\n").split("=", 2)
        vars[var] = val.strip('""').strip("''")

arch = platform.machine().lower()
if arch == "x86_64":
    arch = "amd64"
vars["ARCH"] = arch

print(f"Detected version: {vars['version']}")
new_version = None
if len(sys.argv) > 1 and sys.argv[1] == "--upgrade":
    if vars.get("git_repo") is None:
        print("No github repo found for processing upgrade.")
    new_version = session.get(
        f"https://api.github.com/repos/{vars['git_repo']}/releases/latest"
    ).json()["tag_name"]
    if new_version[0] == "v":
        new_version = new_version[1:]
    if new_version != vars["version"]:
        vars["version"] = new_version
        print(f"Found new version {new_version}")
    else:
        new_version = None

if new_version is None and not (len(sys.argv) > 2 and sys.argv[2] == "--force"):
    print("The package is up-to-date.")
    exit()

for src_type in [k for k in vars.keys() if "sources" in k]:
    try:
        suffix = src_type.split("_")[1]
    except IndexError:
        suffix = ""
    if suffix != "":
        vars["ARCH"] = suffix
        suffix = "_" + suffix

    # Read all the links
    links = [link.strip('""').strip("''") for link in vars[src_type].strip("()").split()]

    # Get the old sums
    old_sums = vars["checksums" + suffix].strip("()").split()
    old_sums = [sum.strip('""').strip("''") for sum in old_sums]

    checksums = []
    for i, link in enumerate(links):
        if old_sums[i] == "SKIP":
            checksums.append("SKIP")
            continue
        # Try to do variable expansions (works up to one level, should be enough)
        to_replace = list(set(re.findall(r"\$\{\w+\}", link)))
        for str in to_replace:
            str_clean = str.strip("${}")
            link = link.replace(str, vars[str_clean])

        checksum = get_file_checksum(link)
        checksums.append(checksum)

    # Build the output line
    if len(checksums) > 1:
        sum_out = f"checksums{suffix}=(\n    '{"'\n    '".join(checksums)}'\n)\n"
    else:
        sum_out = f"checksums{suffix}=('{checksums[0]}')\n"
    skip_next_line = False
    for i, line in enumerate(script):
        if skip_next_line:
            if line.startswith(")"):
                skip_next_line = False
            script[i] = ""
            continue
        if new_version is not None and line.startswith("version="):
            script[i] = f"version={new_version}\n"
            print("Updated version inside script.")
        if line.startswith(f"checksums{suffix}="):
            if len(checksums) > 1:
                skip_next_line = True
            script[i] = sum_out
            print("Updated checksums for " + suffix[1:] + " sources")

timestamp = "{}".format(int(time.time()))

with open(timestamp, "w") as tempfile:
    tempfile.writelines(script)

os.rename(timestamp, "lure.sh")

print("Done!")
