name="jellyfin-autorefresh-new-releases"
version=0.4.19
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64' 'arm64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
maintainer='SinTan1729'
git_repo='SinTan1729/jellyfin-autorefresh-new-releases'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-amd64-linux.tar.gz")
checksums_amd64=('b00e112e15a816e255f9382a3397e5edb2f410028f9232a7fbf4f9705ff5e42a')
sources_arm64=("https://github.com/${git_repo}/releases/download/${version}/jellyfin-autorefresh-${version}-arm64-linux.tar.gz")
checksums_arm64=('431785185d8ada87863f098d68c4800f6f2669a499e970bcba0f81a0e92394c5')

package() {
    mv ${srcdir}/jellyfin-autorefresh-* "${srcdir}/jellyfin-autorefresh"
    # Binary
    install-binary "${srcdir}/jellyfin-autorefresh"
    # Manpage
    install-manual "${srcdir}/jellyfin-autorefresh.1"
}
