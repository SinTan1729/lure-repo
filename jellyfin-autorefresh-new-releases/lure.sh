name="jellyfin-autorefresh-new-releases"
version=0.2.3
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
sources_amd64=("${homepage}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('24bb05b13e42b022089adefd692625d64b4a852c9c69812d7a9c3683be4360f6')
package() {
	# Binary
	install-binary "./jellyfin-autorefresh"
	# Manpage
	install-manual "./jellyfin-autorefresh.1"
}
