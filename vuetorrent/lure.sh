name='vuetorrent'
version=2.35.0
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
checksums_amd64=('6e0c0e6acb563710aaf32cd165cf34da0e5d61bc1a68386e4cf97a648fa8171c')

package() {
    # Unzip and install
    cp -r "${srcdir}" "${pkgdir}/opt"
    # Print usage instructions
    echo "Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
    echo "You might need to mount this directory first if you're using docker."
}
