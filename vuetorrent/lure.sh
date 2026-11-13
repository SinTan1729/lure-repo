name='vuetorrent'
version=2.37.0
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
checksums_amd64=('5244a29314a4befcc1ffb659e8b8b03f8c1a84b7a3d3f26a651bd6069b57a7ed')

package() {
    # Unzip and install
    cp -r "${srcdir}" "${pkgdir}/opt"
    # Print usage instructions
    YELLOW='\033[0;33m'
    NC='\033[0m'
    echo -e "${YELLOW}Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
    echo -e "You might need to mount this directory first if you're using docker.${NC}"
}
