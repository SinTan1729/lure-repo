name="topgrade"
version=17.6.1
release=1
desc="Invoke the upgrade procedure of multiple package managers"
architectures=('amd64' 'arm64' 'armv7')
maintainer='SinTan1729'
homepage='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
git_repo='topgrade-rs/topgrade'

sources_amd64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-x86_64-unknown-linux-musl.tar.gz")
checksums_amd64=('20726ea4519601a4d6549b726f8112c322b5211fa768af9804338ab3b2d1ab6e')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('4a7092b406810759e54cf4a51586aae8fd15053028ece1f1edec483a08f60731')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('993c8f3969d38bd3cd7952a877d8b1a2b85edece691e75e148d9448f3b425dca')

package() {
    # install binary
    install-binary "./${name}"
    # manpage
    "./${name}" --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >"${name}.8"
    install-manual "./${name}.8"
    # completions
    if [ $(echo $(fish --version | awk '{print $3}')$'\n'3.4.0 | sort -V | head -n1) != '3.4.0' ]; then
        "${name}" --gen-completion fish | install-completion fish "${name}"
    fi
    "${name}" --gen-completion zsh | install-completion zsh "${name}"
    "${name}" --gen-completion bash | install-completion bash "${name}"

    echo "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates, as it won't work with this installation"
}
