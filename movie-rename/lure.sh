# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.1.6
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('b4f7d946ecd4475c33142d79f5570325ae549d67cc47333955c701b554db49b1')
package() {
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
}
