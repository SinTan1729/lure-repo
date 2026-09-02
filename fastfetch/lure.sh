name='fastfetch'
version=2.68.1
release=1
desc='Like neofetch, but much faster because written in C.'
homepage='https://github.com/fastfetch-cli/fastfetch'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('fastfetch' 'flashfetch')
conflicts=('fastfetch' 'flashfetch')
git_repo='fastfetch-cli/fastfetch'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-amd64.tar.gz")
checksums_amd64=('0c51ef6fa3e976eb5038fe0afda38629d3ca07947740bb0e3354c7c4f1238c0c')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-aarch64.tar.gz")
checksums_arm64=('d3369aa9c1bc77fd8bd7ba3be2ae2cdcece4a137620c48a9de58026779fdb7d4')

package() {
    [ ${ARCH} = arm64 ] && ARCH=aarch64
    # Build package
    mv -T "${srcdir}/fastfetch-linux-${ARCH}" ${pkgdir}
}
