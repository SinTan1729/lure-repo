name="topgrade"
version=17.12.2
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
checksums_amd64=('ad6d9ca6932332757f21e4078ae4290cced235f92a4d380df3a250e6da779ca9')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('a762e7161ac1370f77795be4cc483e183b93249db8b58e1ac355bd02a10bb2e3')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('1e220209f4c89d15d3a6a8ebe8319cd97046f516a1265a5a3bbd0b511051174a')

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
