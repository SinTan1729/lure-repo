name='cockpit-sensors'
version=2.2.2
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
checksums=('96380fb9912a78117a673a6225fcb4e9dc7269cdb473aa3d4e4be9533bec2160')

package() {
    # Binary
    mkdir -p "${pkgdir}/usr/share/cockpit"
    mv "${srcdir}/${name}" "${pkgdir}/usr/share/cockpit/sensors"
    # Notice
    RED='\033[0;31m'
    NC='\033[0m'
    echo -e "${RED}Make sure to run sensors-detect.${NC}"
}
