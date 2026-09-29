name="immich-custom-memories"
version=0.2.2
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
maintainer='SinTan1729'
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-amd64-linux.tar.gz")
checksums_amd64=('574afb120a9ea9937fa7125c24e3764e90d8c9ce66f04c8f7c16a3ad94b87747')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-arm64-linux.tar.gz")
checksums_arm64=('f99dd75badf242717eec6b33f9550956f1eb68abf6cbd7311066b1b674b57f99')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
