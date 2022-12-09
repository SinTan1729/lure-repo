# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
name="movie_rename"
version=1.1.2
release=2
desc="A simple tool to rename movies, written in Rust."
architectures=('amd64')
homepage='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie_rename')
sources=("${homepage}/releases/download/${version}/${name}.tar.gz")
checksums=('a36d52180e26514c736e89e1d267d17b672058829d09b70d6fcb2338a916da9b')
package() {
	# Binary
	install -Dm755 ./${name} "${pkgdir}/usr/local/bin/${name}"
	# Manpage
	install -Dm644 ./${name}.1 "${pkgdir}/usr/local/man/man1/${name}.1"
}
