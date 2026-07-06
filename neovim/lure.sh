name='neovim'
version=0.12.4
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
checksums_amd64=('012bf3fcac5ade43914df3f174668bf64d05e049a4f032a388c027b1ebd78628')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/nvim-linux-arm64.tar.gz")
checksums_arm64=('ceb7e88c6b681f0515d135dcdfad54f5eb4373b25ce6172197cd9a69c758063f')

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
