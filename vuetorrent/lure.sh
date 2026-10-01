name='vuetorrent'
version=2.36.1
release=1
desc='The sleekest looking WEBUI for qBittorrent made with Vuejs!'
homepage='https://github.com/WDaan/VueTorrent'
architectures=('amd64')
maintainer='SinTan1729'
license=('GPL3')
provides=('vuetorrent')
conflicts=('vuetorrent')
git_repo='WDaan/VueTorrent'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}.zip")
checksums_amd64=('70b67531f0f3bc36c8bd05d82cc7ba1ee37c71c17f0b6c45f522200e35e66f37')

package() {
    # Unzip and install
    cp -r "${srcdir}" "${pkgdir}/opt"
    # Print usage instructions
    YELLOW='\033[0;33m'
    NC='\033[0m'
    echo -e "${YELLOW}Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
    echo -e "You might need to mount this directory first if you're using docker.${NC}"
}
