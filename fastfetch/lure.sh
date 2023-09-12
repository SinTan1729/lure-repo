name='fastfetch'
version=VERSION
release=3
desc='Like neofetch, but much faster because written in C.'
homepage='https://github.com/fastfetch-cli/fastfetch'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('fastfetch', 'flashfetch')
conflicts=('fastfetch', 'flashfetch')
dependencies=('rpm2cpio', 'zstd')
git_repo='fastfetch-cli/fastfetch'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-${version}-Linux.rpm" -o ${name}.rpm
	# Build package
	echo Creating the package
	cd ${pkgdir}
	rpm2cpio ${srcdir}/${name}.rpm | zstd -d | cpio -idmv
}
