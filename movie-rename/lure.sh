# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.3.2
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('fbbe58a7343bf89f2a3692e9331cc2fd1237614f4924fa9d3c85c1d257f1a256')
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
