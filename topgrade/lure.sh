name="topgrade"
version=17.14.0
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
checksums_amd64=('2d722eb5b833deffe48b0db10be056d24f848d17e59e75be96f7db5c4a54a7a4')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('e8b14bb19752158e116842b97c1da3e551b0fe7b4c2ff36715ef13f8353f5219')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('08857997ea88d5906f507ab1c712a9e0513bf236857eca69c307d069245a450c')

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
