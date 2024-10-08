name='cockpit-docker-fork'
_name='cockpit-docker'
version=VERSION
release=2
desc='Manage your docker containers from Cockpit'
homepage='https://github.com/mrevjd/cockpit-docker'
architectures=('all')
maintainer='SinTan1729'
license=('LGPL-2.1')
provides=()
conflicts=()
deps=()
git_repo='mrevjd/cockpit-docker'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${_name}.tar.gz" -o ${name}.tar.gz
	# Build package
	echo "Creating the package"
	tar -xf ${name}.tar.gz -C .
	# Binary
	mkdir -p "${pkgdir}/usr/share/cockpit"
	sed -i 's/v1\.12/v1\.24/g' docker/docker.js
	mv docker "${pkgdir}/usr/share/cockpit/"
}
