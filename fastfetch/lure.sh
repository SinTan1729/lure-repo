name='fastfetch'
version=VERSION
release=3
desc='Like neofetch, but much faster because written in C.'
homepage='https://github.com/fastfetch-cli/fastfetch'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('fastfetch')
conflicts=('fastfetch')
git_repo='fastfetch-cli/fastfetch'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	[ ${ARCH} == "arm64" ] && ARCH="aarch64"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-linux-${ARCH}.tar.gz" -o ${name}.tar.gz
	# Build package
	echo Creating the package
	mkdir tmpdir
	tar -xvf "${name}.tar.gz" -C tmpdir
	mv -T tmpdir/fastfetch-linux-${ARCH} ${pkgdir}
}
