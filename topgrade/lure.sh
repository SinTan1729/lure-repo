name="topgrade"
version=17.7.0
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
checksums_amd64=('50afc892f83513fad88e13d3f073c3d1dc9006728c559cfd860dfb7710faa0ad')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('6abc8853aa76a78b78dbc880d8786edb19d93bdf99349e8657b0bf93baebf180')
sources_armv7=("https://github.com/${git_repo}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_armv7=('97d891d1118055aa256d7a4c26cd621d1fc8cf51de9a8e61bd485e45f458bb9d')

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

    echo "!!! IMPORTANT !!!"
    echo "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates."
    echo "It won't work with this installation."
}
