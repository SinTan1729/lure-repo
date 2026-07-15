name='vuetorrent'
version=2.34.1
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
checksums_amd64=('6cf0f2c6533835602b1d18cd26e83926d53c9330e0e898e971af6850233d20eb')

package() {
    # Unzip and install
    cp -r "${srcdir}" "${pkgdir}/opt"
    # Print usage instructions
    echo "Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
    echo "You might need to mount this directory first if you're using docker."
}
