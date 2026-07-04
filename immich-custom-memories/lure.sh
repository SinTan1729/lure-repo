name="immich-custom-memories"
version=0.1.1
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories.tar.gz")
checksums_amd64=('b5a489660169d10f52c1ac805937e76a061c5b7243e2e3d1f7b00cdb6dacbc78')

package() {
    # Binary
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
