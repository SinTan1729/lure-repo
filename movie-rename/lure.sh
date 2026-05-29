# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.3.10
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('1cf46ac2fe89d81d28feae67820054953c26b771c3054ce788d606999e112639')
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
