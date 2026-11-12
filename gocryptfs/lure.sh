name='gocryptfs'
version=2.7.0
release=1
desc='Encrypted overlay filesystem written in Go'
homepage='https://github.com/rfjakob/gocryptfs'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('gocryptfs' 'gocryptfs-xray')
conflicts=('gocryptfs' 'gocryptfs-xray')
git_repo='rfjakob/gocryptfs'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}_v${version}_linux-static_${ARCH}.tar.gz")
checksums_amd64=('3e2e2a5270921e01bfbb46ebc39b614d0146d6961a28de4ba9cc5d43534b8dcf')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}_v${version}_linux-static_${ARCH}.tar.gz")
checksums_arm64=('0b58b9d1c09a93a8b43543e61b1b690281d39ba054e3b48804c07acdcd465821')

package() {
    # Binaries
    install-binary "${srcdir}/${name}"
    install-binary "${srcdir}/${name}-xray"
    # Manpages
    install-manual "${srcdir}/${name}.1"
    install-manual "${srcdir}/${name}-xray.1"
}
