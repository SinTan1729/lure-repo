name='neovim'
version=0.12.6
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
checksums_amd64=('474430d53e6264f6d6dd18db42d6dc9df3a1b56ca9e88a325bbf860e1a811d87')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/nvim-linux-arm64.tar.gz")
checksums_arm64=('8f1f64a0bdb97247034038c3823c6cbad5bdf9ecd5751b85494b71c3ee04c815')

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
