name="topgrade"
version=17.3.0
release=1
desc="Invoke the upgrade procedure of multiple package managers"
architectures=('amd64' 'arm64' 'armv7')
maintainer='SinTan1729'
homepage='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
sources_amd64=("${homepage}/releases/download/v${version}/${name}-v${version}-x86_64-unknown-linux-musl.tar.gz")
sources_arm64=("${homepage}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
sources_armv7=("${homepage}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_amd64=('fd1ca2ecee9101c9c10ccdb511ae0b81db5b0041336701f0722840f26a2c0f8a')
checksums_arm64=('ae41bdc31906f99d28ce94c1093337b326460e8b20b559f772e35c694b219569')
checksums_armv7=('c84d51bfce234b47c96704b10ac8b7b73c7b4b019f963749e2bfa4ba00a9f4b8')
package() {
	# install binary
	install-binary "./${name}"
	# manpage
	"./${name}" --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >"${name}.8"
	install-manual "./${name}.8"
	# completions
	if [ $(echo $(fish --version | awk '{print $3}')$'\n'3.4.0 | sort -V | head -n1) != '3.4.0' ]; then
		"${name}" --gen-completion fish | install-completion fish "${name}"
	fi
	"${name}" --gen-completion zsh | install-completion zsh "${name}"
	"${name}" --gen-completion bash | install-completion bash "${name}"

	echo "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates, as it won't work with this installation"
}
