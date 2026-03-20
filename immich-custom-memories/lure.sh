name="immich-custom-memories"
version=0.1.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
sources_amd64=("${homepage}/releases/download/${version}/immich-custom-memories.tar.gz")
checksums_amd64=('14446380283f990298bbef74af3260d4778365a3f81c590f5848d4bbb4cd7e9c')
package() {
	# Binary
	install-binary "./immich-custom-memories"
	# Manpage
	install-manual "./immich-custom-memories.1"
}
