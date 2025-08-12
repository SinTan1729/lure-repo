name="jellyfin-autorefresh-new-releases"
version=0.1.1
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
sources_amd64=("${homepage}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('88e1956e7fa3c06b33528f909e90d4b39f7e86d37ce213664f0724226c059532')
package() {
	# Binary
	install-binary "./jellyfin-autorefresh"
	# Manpage
	install-manual "./jellyfin-autorefresh.1"
}
