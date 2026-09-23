name="jellyfin-autorefresh-new-releases"
version=0.4.12
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('1957e06dfb71373b544b9307c656ac58d13016bf0bf0f503896183e51b94f9c0')

package() {
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
