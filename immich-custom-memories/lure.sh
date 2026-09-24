name="immich-custom-memories"
version=0.1.3
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories.tar.gz")
checksums_amd64=('a8f7ff969c822f88d4a908dec54fa6bda6ede1dbb08eb5eb9269b23ddaaa5afb')

package() {
    # Binary
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
