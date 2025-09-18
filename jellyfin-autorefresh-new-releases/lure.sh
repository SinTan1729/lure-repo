name="jellyfin-autorefresh-new-releases"
version=0.2.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
sources_amd64=("${homepage}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('10368dad7ed05d63fd9b07d18c7e7498ebc9cbe7e327e8c71ec88c1bc6d4f818')
package() {
	# Binary
	install-binary "./jellyfin-autorefresh"
	# Manpage
	install-manual "./jellyfin-autorefresh.1"
}
