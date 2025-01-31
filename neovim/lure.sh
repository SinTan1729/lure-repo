name='neovim'
version=VERSION
release=1
desc='Fork of Vim aiming to improve user experience, plugins, and GUIs'
homepage='https://neovim.io'
git_repo='neovim/neovim'
architectures=('amd64')
maintainer='SinTan1729'
license=('Apache-2.0')
provides=('neovim')
conflicts=('neovim')

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/nvim-linux-x86_64.tar.gz" -o ${name}.tar.gz
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
    mkdir ${pkgdir}/usr
    cd ./nvim-linux-x86_64
    cp -r share lib bin ${pkgdir}/usr/
}
