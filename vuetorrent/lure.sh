name='vuetorrent'
version=2.34.0
release=4
desc='The sleekest looking WEBUI for qBittorrent made with Vuejs!'
homepage='https://github.com/WDaan/VueTorrent'
architectures=('amd64')
maintainer='SinTan1729'
license=('GPL3')
provides=('vuetorrent')
conflicts=('vuetorrent')
git_repo='WDaan/VueTorrent'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}.zip")
checksums_amd64=('22f34c20f6a5704e3b37c3ed73956af7bda5536c10458575c52b0618851b665e')

package() {
    # Unzip and install
    cp -r "${srcdir}" "${pkgdir}/opt"
    # Print usage instructions
    echo "Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
    echo "You might need to mount this directory first if you're using docker."
}
