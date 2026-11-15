name="immich-custom-memories"
version=0.4.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
maintainer='SinTan1729'
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-amd64-linux.tar.gz")
checksums_amd64=('957d6f0b723b0225fb1fbc5c9ac8c062c16e30ab98297f1afeb700d6d143d9fb')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-arm64-linux.tar.gz")
checksums_arm64=('efa5a4a25e14d3235c45696d2144938e5162c5ed05f61fb8f575681cb1199186')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
