name="immich-custom-memories"
version=0.3.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
maintainer='SinTan1729'
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-amd64-linux.tar.gz")
checksums_amd64=('4cf88ae7305c5de6fdbaf077543fb82ec7cc28cc3cec8c1a15b954ef2ccc4b89')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-arm64-linux.tar.gz")
checksums_arm64=('c834faa3d70e1bcc1ae4ba0b2830d4e855769a5d2dcceceaa3f479e3c4ad7b71')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
