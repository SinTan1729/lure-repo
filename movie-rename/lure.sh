# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=1.2.2
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums=('c21bc70279e6cde155b452adb85b690bfac307a70adf87f3578907dd0d4afdcd')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
