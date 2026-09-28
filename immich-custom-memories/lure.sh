name="immich-custom-memories"
version=0.2.1
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-amd64-linux.tar.gz")
checksums_amd64=('36df2b0871e29e8ce8f19e0c179022587d596b5acb31f09e1ff4ea674d5fb8c2')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories-${version}-arm64-linux.tar.gz")
checksums_arm64=('56a7bb66517932356d9d9209548e966c6cc2314c3adaabcd52dea7b2b17d8ae9')

package() {
    # Binary
    mv ${srcdir}/immich-custom-memories-* "${srcdir}/immich-custom-memories"
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
