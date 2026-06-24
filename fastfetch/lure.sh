name='fastfetch'
version=2.65.1
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
checksums_amd64=('3b6d58e167142067f8231132f428cfe91a94633e33be0a6d867bdcd84e68294d')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-aarch64.tar.gz")
checksums_arm64=('a00a3461c1e0bf2d4ba430d7d78ca92d4df9a8f6a08466f6669865599f5b963d')

package() {
    [ ${ARCH} = arm64 ] && ARCH=aarch64
    # Build package
    mv -T "${srcdir}/fastfetch-linux-${ARCH}" ${pkgdir}
}
