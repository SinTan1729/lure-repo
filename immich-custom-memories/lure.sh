name="immich-custom-memories"
version=0.1.2
release=1
desc="Get missing metadata for new releases in Jellyfin"
architectures=('amd64')
homepage="https://github.com/SinTan1729/immich-custom-memories"
license=('GPL3')
provides=('immich-custom-memories')
git_repo='SinTan1729/immich-custom-memories'

sources_amd64=("https://github.com/${git_repo}/releases/download/${version}/immich-custom-memories.tar.gz")
checksums_amd64=('463c34ac9705d1a34c92fbee933e0dac79c5a8097c3226c70debe46ebf86d720')

package() {
    # Binary
    install-binary "${srcdir}/immich-custom-memories"
    # Manpage
    install-manual "${srcdir}/immich-custom-memories.1"
}
