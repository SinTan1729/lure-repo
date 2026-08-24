name='neovim'
version=0.12.5
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
checksums_amd64=('bce0f56eda1f1b1db6eee8f4133d7a38813ea07933837dd1777411ca384c6875')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/nvim-linux-arm64.tar.gz")
checksums_arm64=('1aa5ca085249580ae0f91eb14f27ec0919773ff2d99a163d03f3d6c21ac29725')

package() {
    case $ARCH in
    amd64)
        tmp_arch=x86_64
        ;;
    *)
        tmp_arch=$ARCH
        ;;
    esac
    cp -r "${srcdir}/nvim-linux-${tmp_arch}" "${pkgdir}/usr"
}
