# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=1.2.0
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums=('07f805e2c2cf06e7b2ba21b0e4bf5d6459d3e7991267f6792a4b2116481da1b8')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
