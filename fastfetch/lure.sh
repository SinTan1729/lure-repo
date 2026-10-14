name='fastfetch'
version=2.70.0
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
checksums_amd64=('945b941b2a85e8de88b4c89714ad18ee6a7a129bb3c544bb448e9e0e027c226a')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-aarch64.tar.gz")
checksums_arm64=('fff4a127e4d76242e3bdac2a12430fc252fd6086d3eb30aee0382c3b0fece478')

package() {
    [ ${ARCH} = arm64 ] && ARCH=aarch64
    # Build package
    mv -T "${srcdir}/fastfetch-linux-${ARCH}" ${pkgdir}
}
