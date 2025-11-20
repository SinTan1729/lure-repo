name="topgrade"
version=16.4.2
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
checksums_amd64=('85738b50355d3bf876ff9cee7e2a0d817e2c96aaa887fcc8f163cfe36d7cc029')
checksums_arm64=('081c1c1e90fbcb7a75cc1496a75b39fd4ca0e2744dd7b5d58d1645e24deb32bb')
checksums_armv7=('a9e239e5083a59fac4d8834c8a9764ba8b6f104143f7bed46546742eb8ec6846')
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
