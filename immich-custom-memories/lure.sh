name="immich-custom-memories"
version=0.1.0
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
sources_amd64=("${homepage}/releases/download/${version}/immich-custom-memories.tar.gz")
checksums_amd64=('56f5e1a5fc4e0aca89aabd9a0296c592ee7318d6374b21ac10325a6b6c13c542')
package() {
	# Binary
	install-binary "./immich-custom-memories"
	# Manpage
	install-manual "./immich-custom-memories.1"
}
