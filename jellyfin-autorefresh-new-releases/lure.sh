name="jellyfin-autorefresh-new-releases"
version=0.5.3
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
maintainer='SinTan1729'
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-amd64-linux.tar.gz")
checksums_amd64=('fe46843c1765f1493698378a24faa1b9b47990ede236396dba46741ed3f66a1d')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-arm64-linux.tar.gz")
checksums_arm64=('e0592b54fe14f0eda38f3950008674daf5e59289a4b964083e456f54794840cc')

package() {
    mv ${srcdir}/jellyfin-autorefresh-* "${srcdir}/jellyfin-autorefresh"
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
