name='lf'
version=VERSION
release=1
desc='A terminal file manager written in Go'
homepage='https://github.com/gokcehan/lf'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('lf')
conflicts=('lf')
git_repo="gokcehan/lf"

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(r.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	vers="$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(r.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
	echo Installing ${name} ${vers}
	curl -L "https://github.com/${git_repo}/releases/download/${vers}/${name}-linux-${architecture}.tar.gz" -o ${name}.tar.gz
	tar xzf "${name}.tar.gz" -C .
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
}
 