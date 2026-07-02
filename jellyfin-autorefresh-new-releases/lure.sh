name="jellyfin-autorefresh-new-releases"
version=0.3.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('20ec1f06b3b1481e233f1a1bd805c4414d8e9211b056422627ac8ed3f93f2881')

package() {
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
