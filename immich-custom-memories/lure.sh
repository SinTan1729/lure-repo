name="immich-custom-memories"
version=0.3.1
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
maintainer='SinTan1729'
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-amd64-linux.tar.gz")
checksums_amd64=('cef1db4857cefcb4d087899cb639bb4d249beb0e2ef02d9beae74257e22cbab7')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-arm64-linux.tar.gz")
checksums_arm64=('0dfb4ba52b2b64b54c315526470e4b141eef9a6a8cb90233e7d895a76b7fa799')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
