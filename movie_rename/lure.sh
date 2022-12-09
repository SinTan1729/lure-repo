# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie_rename"
version=1.1.2
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie_rename')
sources=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums=('2a95ce06853123b44fb0386c82d41cd8b7248ff2480021f492b6c0bae6d01a71')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
