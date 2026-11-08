name='cockpit-sensors'
version=2.4.0
release=1
desc='A cockpit module that displays all data reported by lm-sensors'
homepage='https://github.com/ocristopfer/cockpit-sensors'
architectures=('all')
maintainer='SinTan1729'
license=('LGPL-2.1')
provides=()
conflicts=()
deps=('lm_sensors' 'cockpit')
git_repo='ocristopfer/cockpit-sensors'

sources=("https://github.com/${git_repo}/releases/latest/download/${name}.tar.xz")
checksums=('a66b8a97da8f2254c21ea8b941675e81464285fb067ea4ab7747cdb81265502b')

package() {
    # Binary
    mkdir -p "${pkgdir}/usr/share/cockpit"
    mv "${srcdir}/${name}" "${pkgdir}/usr/share/cockpit/sensors"
    # Notice
    RED='\033[0;31m'
    NC='\033[0m'
    echo -e "${RED}Make sure to run sensors-detect.${NC}"
}
