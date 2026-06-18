name='neovim'
version=0.12.3
release=1
desc='Fork of Vim aiming to improve user experience, plugins, and GUIs'
homepage='https://neovim.io'
git_repo='neovim/neovim'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('Apache-2.0')
provides=('neovim')
conflicts=('neovim')

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/nvim-linux-x86_64.tar.gz")
checksums_amd64=('c441b547142860bf01bcce39e36cbed185c41112813e15443b16e5237750724d')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/nvim-linux-arm64.tar.gz")
checksums_arm64=('e055af73fa9c72b37456da8d204fa5c09850bc07e80e9176fe3b87d4afb7a3fc')

package() {
    mkdir ${pkgdir}/usr
    [ $ARCH = amd64 ] && ARCH=x86_64
    cd "${srcdir}/nvim-linux-${ARCH}"
    cp -r share lib bin ${pkgdir}/usr/
}
