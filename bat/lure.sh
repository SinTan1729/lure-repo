name='bat'
version=0.26.1
release=1
desc='A cat(1) clone with syntax highlighting and Git integration'
homepage='https://github.com/sharkdp/bat'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('bat')
conflicts=('bat')
git_repo='sharkdp/bat'

sources_amd64=("https://github.com/${git_repo}/releases/download/v${version}/bat-v${version}-x86_64-unknown-linux-musl.tar.gz")
checksums_amd64=('0dcd8ac79732c0d5b136f11f4ee00e581440e16a44eab5b3105b611bbf2cf191')

package() {
    tardir="${srcdir}/bat-v${version}-x86_64-unknown-linux-musl"
    # Binary
    install-binary "${tardir}/bat"
    # Manpage
    install-manual "${tardir}/bat.1"
    # Autocomplete
    install-completion fish bat <"${tardir}/autocomplete/bat.fish"
    install-completion zsh bat <"${tardir}/autocomplete/bat.zsh"
    install-completion bash bat <"${tardir}/autocomplete/bat.bash"
}
