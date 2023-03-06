name='vuetorrent'
version=VERSION
release=4
desc='The sleekest looking WEBUI for qBittorrent made with Vuejs!'
homepage='https://github.com/WDaan/VueTorrent'
architectures=('amd64')
maintainer='SinTan1729'
license=('GPL3')
provides=('vuetorrent')
conflicts=('vuetorrent')
git_repo='WDaan/VueTorrent'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}.zip" -o ${name}.zip
	# Unzip and install
	mkdir -p "${pkgdir}/opt"
	unzip -qq vuetorrent.zip -d "${pkgdir}/opt"
	# Print usage instructions
	echo "Make sure to choose /opt/vuetorrent as the location of the custom WebUI in  qBittorrent settings."
	echo "You might nedd to mount this directory first if you're using docker."
}
