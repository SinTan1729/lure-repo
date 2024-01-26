name="topgrade"
version=14.0.1
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
checksums_amd64=('bb656d9a04bddd0e2e8bca73529d6b2c7872a0b5f92bfdfb5ed27f91cc3a29cb')
checksums_aarch64=('80c96e64f47e7ffc4db5cb405ea062e257030f88c89daca129383f981e83e007')
checksums_armv7=('cf48edbacd40dbf94ee3e47f2ba2a9d78d86af1ab0c8319f79f8d25b17bfa3d1')
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
