name='gocryptfs'
version=2.6.1
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
checksums_amd64=('49b8c0eb0f6373b6ac99c394a52909d8478e74c08d0961527c1162967cc28c44')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}_v${version}_linux-static_${ARCH}.tar.gz")
checksums_arm64=('64576d550ab8af3f1dc729e93779540c5ecc00967d0185aae51a29a3755d86d0')

package() {
    # Binaries
    install-binary "${srcdir}/${name}"
    install-binary "${srcdir}/${name}-xray"
    # Manpages
    install-manual "${srcdir}/${name}.1"
    install-manual "${srcdir}/${name}-xray.1"
}
