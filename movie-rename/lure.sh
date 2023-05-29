# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie-rename"
version=2.1.3
release=1
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie-rename')
sources_amd64=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums_amd64=('645bb6ff5c6235edd7347d7a144e8efe62af1e99cba1e9376f620765ebac6b81')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
