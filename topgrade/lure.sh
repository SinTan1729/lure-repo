name="topgrade"
version=17.13.1
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
checksums_amd64=('0ba74b9995a0aa5fbd2796361e647e93a964e7fe894c4bf9daeee1449d75f26a')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('11fa78f5c5db0fce6944469a627dfb89b49624c73d2419bd421d4ba29d08ed6d')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('0bcfd049d9d47fdb642542b3e085d20c0041f23740345ba2d75cedea7b018f03')

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
