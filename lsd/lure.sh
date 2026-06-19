name='lsd'
version=1.2.0
release=1
desc='The next gen ls command'
homepage='https://github.com/lsd-rs/lsd'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('APACHE-2.0')
provides=('lsd')
conflicts=('lsd')
git_repo='lsd-rs/lsd'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}-v${version}-x86_64-unknown-linux-musl.tar.gz")
checksums_amd64=('77849da1210336534258551a581401ba19ae6b8d7b66a2a1feff148ad41e3814')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
checksums_arm64=('642ecb1a763b9f790a99c83a1445c117a6813ed4edb5d498d4420423c6353eb8')

package() {
    cd $srcdir/lsd*
    # Binary
    install-binary "${name}"
    # Manpage
    install-manual "${name}.1"
    # Autocomplete
    install-completion fish "${name}" <"autocomplete/${name}.fish"
    install-completion zsh "${name}" <"autocomplete/_${name}"
    install-completion bash "${name}" <"autocomplete/${name}.bash-completion"
}
