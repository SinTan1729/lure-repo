# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.0.0
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('08f26365c2640dbac2c27f23cdcc58a4a3f62ea0b48bbba88af5c29590f5d401')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
