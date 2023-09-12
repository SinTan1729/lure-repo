name='gocryptfs'
version=VERSION
release=2
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
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}_${version}_linux-static_${ARCH}.tar.gz" -o ${name}.tar.gz
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
	# Binaries
	install-binary "./${name}"
	install-binary "./${name}-xray"
	# Manpages
	install-manual "./${name}.1"
	install-manual "./${name}-xray.1"
}
