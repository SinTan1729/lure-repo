# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.3.0
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('d44a9ba42884f24bf4b67780c404c2647167802b44b3b8988400ef0b53da1cf0')
package() {
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
	# Completions
	cat "./${name}.bash" | install-completion bash
	cat "./${name}.fish" | install-completion fish
	cat "./$_{name}" | install-completion zsh
}
