# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.1.1
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('27f7353bbd315a1a7910060e75d8d37fc9217b83febf118769c02ba5e6bb0fbe')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
