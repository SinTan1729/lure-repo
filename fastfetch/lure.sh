name='fastfetch'
version=2.67.1
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
checksums_amd64=('adc8a9eb64eccef267e50bb1e6f9a767bb608da5ee4a3b652ef36a10d9105d4d')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-aarch64.tar.gz")
checksums_arm64=('b974b76e3d8df90311440a2250c83561aa0a863f129925285f2789d932b4cbaa')

package() {
    [ ${ARCH} = arm64 ] && ARCH=aarch64
    # Build package
    mv -T "${srcdir}/fastfetch-linux-${ARCH}" ${pkgdir}
}
