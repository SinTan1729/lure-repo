name="topgrade"
version=16.6.0
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
checksums_amd64=('074aaf7d4229dc13012c01fd3abdfebf04e8c901e5ae125e22b3b1fcd7078290')
checksums_arm64=('aa4a6be8a398005cabd84f41e25a450f7e2047258ddfd50a678d8fd3ef0d944b')
checksums_armv7=('ac98781f7d43784b7a71f6d4f5709e8dec50d1e44e98817e0a630e158b61d25f')
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
