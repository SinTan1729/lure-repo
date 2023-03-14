name="topgrade"
version=10.3.3
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
checksums_amd64=('09844a967ea34e90a4c8d95a27cb70af09bc79d6148cf288790bed096b1b00e7')
checksums_aarch64=('59a0dca3754162212138cead0a7e422f1c5c71a0f7699b4853d32bcadf43e900')
checksums_armv7=('fc2af1b177560382f7f6504fabce19a024393b26c0e90fb89751f96be161b96e')
package() {
	# disable self-update as it won't work
	echo '#!/bin/sh'$'\n\n''TOPGRADE_NO_SELF_UPGRADE=true /opt/topgrade/topgrade "$@"' >topgrade-sh
	# install binary
	install -Dm755 ./topgrade "$pkgdir/opt/topgrade/topgrade"
	install -Dm755 ./topgrade-sh "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/share/man/man8/topgrade.8"
	# completions
	if $(command -v fish &>/dev/null); then
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
}
