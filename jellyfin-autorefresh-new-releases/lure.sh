name="jellyfin-autorefresh-new-releases"
version=0.2.7
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/jellyfin-autorefresh-new-releases"
license=('GPL3')
provides=('jellyfin-autorefresh')
sources_amd64=("${homepage}/releases/download/${version}/jellyfin-autorefresh.tar.gz")
checksums_amd64=('6af1ab8dba18b5e94775bbd5eba0b86564c6b5cd419af9305633c50bf5c7113b')
package() {
	# Binary
	install-binary "./jellyfin-autorefresh"
	# Manpage
	install-manual "./jellyfin-autorefresh.1"
}
