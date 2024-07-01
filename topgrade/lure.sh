name="topgrade"
version=15.0.0
release=1
desc="Invoke the upgrade procedure of multiple package managers"
architectures=('amd64' 'aarch64' 'armv7')
maintainer='SinTan1729'
homepage='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
sources_amd64=("${homepage}/releases/download/v${version}/${name}-v${version}-x86_64-unknown-linux-musl.tar.gz")
sources_aarch64=("${homepage}/releases/download/v${version}/${name}-v${version}-aarch64-unknown-linux-musl.tar.gz")
sources_armv7=("${homepage}/releases/download/v${version}/${name}-v${version}-armv7-unknown-linux-gnueabihf.tar.gz")
checksums_amd64=('04c9184cd3a71e9a72f7641101fc2fe85ea6eb69bb5bb1a2af43cd697dccfdb0')
checksums_aarch64=('7ffd78eccbff00902652278472ad782ebe0965035d3be7e490b8fc02d8534028')
checksums_armv7=('36228167645bf676eb024733782cc628c593cf8e4bcbe9e178dfc25c371a18da')
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
