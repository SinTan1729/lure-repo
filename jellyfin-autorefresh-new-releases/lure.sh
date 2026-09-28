name="jellyfin-autorefresh-new-releases"
version=0.4.15
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
maintainer='SinTan1729'
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-amd64-linux.tar.gz")
checksums_amd64=('62d63af42fd239d624dd936a9be8f65e4bd320b49e7d32e9d1157905be6e6f01')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-arm64-linux.tar.gz")
checksums_arm64=('a15a5f81cf243c17783969328b28a10dfc0f962e74d6e96b6f3c406637fa5782')

package() {
    mv ${srcdir}/jellyfin-autorefresh-* "${srcdir}/jellyfin-autorefresh"
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
