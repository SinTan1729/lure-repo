name="jellyfin-autorefresh-new-releases"
version=0.6.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
maintainer='SinTan1729'
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-amd64-linux.tar.gz")
checksums_amd64=('4159a2b3f794e45e13b1513c434cc59dfe166dfcdd668a24a79e282384c352b9')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-arm64-linux.tar.gz")
checksums_arm64=('8524c1c38ae314d024a533191c72911df14e6a1847fcce1d70333528c2a84c7e')

package() {
    mv ${srcdir}/jellyfin-autorefresh-* "${srcdir}/jellyfin-autorefresh"
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
