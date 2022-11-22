name='gocryptfs'
version=VERSION
release=1
desc='Encrypted overlay filesystem written in Go'
homepage='https://github.com/rfjakob/gocryptfs'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('gocryptfs' 'gocryptfs-xray')
conflicts=('gocryptfs' 'gocryptfs-xray')
git_repo='rfjakob/gocryptfs'

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}_${version}_linux-static_${ARCH}.tar.gz" -o ${name}.tar.gz
	# Build package
	echo Creating the package
	tar -xzf "${name}.tar.gz" -C .
	# Binaries
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	install -Dm755 "./${name}-xray" "${pkgdir}/usr/local/bin/${name}-xray"
	# Manpages
	install -Dm644 "./${name}.1" "${pkgdir}/usr/local/share/man/man1/${name}.1"
	install -Dm644 "./${name}-xray.1" "${pkgdir}/usr/local/share/man/man1/${name}-xray.1"
}
 
