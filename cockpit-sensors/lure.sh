name='cockpit-sensors'
version=VERSION
release=1
desc='A cockpit module that displays all data reported by lm-sensors'
homepage='https://github.com/ocristopfer/cockpit-sensors'
architectures=('all')
maintainer='SinTan1729'
license=('LGPL-2.1')
provides=()
conflicts=()
deps=('lm-sensors')
git_repo='ocristopfer/cockpit-sensors'

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}.tar.xz" -o ${name}.tar.xz
	# Build package
	echo Creating the package
	tar -xf ${name}.tar.xz ${name}/dist
	# Binary
	mkdir -p "${pkgdir}/usr/share/cockpit"
	mv ${name}/dist "${pkgdir}/usr/share/cockpit/sensors"
	# Notice
	echo Make sure to run sensors-detect
}
 