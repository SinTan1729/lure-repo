# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.4.1
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie-rename'
license=('GPL3')
provides=('movie-rename')
git_repo='SinTan1729/movie-rename'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('5c49e1ce1e8e21a08b9c933001cb3ca5f7827fd829f98796a1ab477de13ebe1e')

package() {
    # Binary
    install-binary "${srcdir}/${name}"
    # Manpage
    install-manual "${srcdir}/${name}.1"
    # Completions
    install-completion bash "${name}" <"${srcdir}/${name}.bash"
    install-completion fish "${name}" <"${srcdir}/${name}.fish"
    install-completion zsh "${name}" <"${srcdir}/_${name}"
}
