name='neovim'
version=VERSION
release=1
desc='Fork of Vim aiming to improve user experience, plugins, and GUIs'
homepage='https://neovim.io'
git_repo='neovim/neovim'
architectures=('amd64', 'arm64')
maintainer='SinTan1729'
license=('Apache-2.0')
provides=('neovim')
conflicts=('neovim')

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name' | cut -c 2-)"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	if [ "$ARCH" = "amd64" ]; then
		ARCHNAME="x86_64"
	else 
		ARCHNAME="arm64"
	fi
	curl -L "https://github.com/${git_repo}/releases/latest/download/nvim-linux-${ARCHNAME}.tar.gz" -o ${name}.tar.gz
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
    mkdir ${pkgdir}/usr
    cd ./nvim-linux-${ARCHNAME}
    cp -r share lib bin ${pkgdir}/usr/
}
