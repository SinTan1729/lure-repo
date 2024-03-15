name='headscale'
version=VERSION
release=1
desc=' An open source, self-hosted implementation of the Tailscale control server'
homepage='https://archlinux.org/packages/extra/x86_64/headscale/'
architectures=('amd64')
maintainer='SinTan1729'
license=('BSD')
provides=('headscale')
conflicts=('headscale')

sources=()
checksums=()

version() {
	printf "$(curl ${homepage} | sed -rn 's/<title>.*headscale (.*)-.*<\/title>/\1/p')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "${homepage}/download/" -o ${name}.tar.zst
	# Build package
	echo "Creating the package"
	tar xf "${name}.tar.zst" -C ${pkgdir}
}
