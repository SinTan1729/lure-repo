name="jellyfin-autorefresh-new-releases"
version=0.4.16
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
maintainer='SinTan1729'
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-amd64-linux.tar.gz")
checksums_amd64=('a6b1043b3fafd176007a5eba145078f3525668b1ee775bb014f22fa5d72f039f')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-arm64-linux.tar.gz")
checksums_arm64=('f3298998b65470a48d8ae20a358d327ac6e54ba53e697999e12f8085da8c612b')

package() {
    mv ${srcdir}/jellyfin-autorefresh-* "${srcdir}/jellyfin-autorefresh"
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
