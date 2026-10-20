name="topgrade"
version=17.14.1
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
checksums_amd64=('04e9896bb55a36b9232532c7f7f701392fc2169ddf91155a353440198c07e278')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('3529722b56a2bb0e95cbfcbb74b28f2ee96b48ebbd44a958081891b074d6859a')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('21cc1869c83ff8a88d2b179dbf308aac4779aa251860dbaa5e443efbd3793fce')

package() {
    # install binary
    install-binary "${srcdir}/${name}"
    # manpage
    "${srcdir}/${name}" --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >"${name}.8"
    install-manual "${srcdir}/${name}.8"
    # completions
    if [ $(echo $(fish --version | awk '{print $3}')$'\n'3.4.0 | sort -V | head -n1) != '3.4.0' ]; then
        "${name}" --gen-completion fish | install-completion fish "${name}"
    fi
    "${name}" --gen-completion zsh | install-completion zsh "${name}"
    "${name}" --gen-completion bash | install-completion bash "${name}"

    RED='\033[0;31m'
    NC='\033[0m'
    echo -e "${RED}!!! IMPORTANT !!!"
    echo "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates."
    echo -e "It won't work with this installation.${NC}"
}
