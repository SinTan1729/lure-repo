name="jellyfin-autorefresh-new-releases"
version=0.1.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
sources_amd64=("${homepage}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=("3ee139b801210f935c49be8d0a73b7ef3301fd2a36201bccfeed3785b7f97744")
package() {
	# Binary
	install-binary "./jellyfin-autorefresh"
	# Manpage
	install-manual "./jellyfin-autorefresh.1"
}
