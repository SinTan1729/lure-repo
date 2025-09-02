# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.3.7
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('5ec7778d0b6d88ca5033b9f10ca8ad793a6f485a7453c01d57b874974b1c2dcd')
package() {
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
	# Completions
	cat "./${name}.bash" | install-completion bash "${name}"
	cat "./${name}.fish" | install-completion fish "${name}"
	cat "./$_{name}" | install-completion zsh "${name}"
}
