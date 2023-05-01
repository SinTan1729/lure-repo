name="topgrade"
version=11.0.2
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
checksums_amd64=('33a7cb1482aaf01ca798f747d29602624cc7a57edc62ca404e930d1a89cd6efc')
checksums_aarch64=('aa3ebf93f1f4cff5a4d09bf433e30ec79c8f741048a747aa7326e3fbb514449a')
checksums_armv7=('f5d99ceb1453aac32ec536da8315dffb27a18ab603c88656e1564d686f81f894')
package() {
	# install binary
	install -Dm755 ./topgrade "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/share/man/man8/topgrade.8"
	# completions
	if $(command -v fish &>/dev/null) && [ $(echo $(fish --version | awk '{print $3}')$'\n'3.4.0 | sort -V | head -n1) != '3.4.0' ]; then
		./topgrade --gen-completion fish >topgrade.fish
		install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	fi
	if $(command -v bash &>/dev/null); then
		./topgrade --gen-completion bash >topgrade.bash
		install -Dm644 ./topgrade.bash "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &>/dev/null); then
		./topgrade --gen-completion zsh >topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
	echo "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates, as it won't work with this installation"
}
