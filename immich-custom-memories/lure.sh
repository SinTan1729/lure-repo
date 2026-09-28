name="immich-custom-memories"
version=0.2.1
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-amd64-linux.tar.gz")
checksums_amd64=('b94d4ac267880cc5501cef4726e3316822c6a3663a99987e58409433d580bf01')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-arm64-linux.tar.gz")
checksums_arm64=('574c917b0bdfbf7a3480f863509880c97a9c18612c844ffbebe259cd21510dc2')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
