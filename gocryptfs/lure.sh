name='gocryptfs'
version=VERSION
release=1
desc='Encrypted overlay filesystem written in Go'
homepage='https://github.com/rfjakob/gocryptfs/'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('gocryptfs', 'gocryptfs-xray')
conflicts=('gocryptfs', 'gocryptfs-xray')
git_repo="rfjakob/gocryptfs"

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "v(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	vers="$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "v(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
	echo Installing ${name} ${vers}
	curl -L "https://github.com/${git_repo}/releases/download/${vers}/${name}_${vers}_linux-static_${architectures}.tar.gz" -o ${name}.tar.gz
	tar xzf "${name}.tar.gz" -C .
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	install -Dm755 "./${name}-xray" "${pkgdir}/usr/local/bin/${name}-xray"
	install -Dm644 "./${name}.1" "${pkgdir}/usr/local/share/man/man1/${name}.1"
	install -Dm644 "./${name}-xray.1" "${pkgdir}/usr/local/share/man/man1/${name}-xray.1"
}
 