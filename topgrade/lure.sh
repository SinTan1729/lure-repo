name="topgrade"
version=10.3.2
release=2
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
checksums_amd64=('9d42fafe04a7c2130f6befe4c8024d1e9496e985532c47dcd930da37afb03aca')
checksums_aarch64=('78b4ca2fcf3c1612cc2065e0ea6c0e74c872d1fab03cd4a1e134f09b8110bbb6')
checksums_armv7=('93879dfd9ca921aef20e51f138ffe1c88d398fc8391bf44da2f733a941a58a2f')
package() {
	# disable self-update as it won't work
	echo '#!/bin/sh'$'\n\n''TOPGRADE_NO_SELF_UPGRADE=true /opt/topgrade/topgrade "$@"' > topgrade-sh
	# install binary
	install -Dm755 ./topgrade "$pkgdir/opt/topgrade/topgrade"
	install -Dm755 ./topgrade-sh "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' > topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/share/man/man8/topgrade.8"
	# completions
	if $(command -v fish &> /dev/null); then
		./topgrade --gen-completion fish > topgrade.fish
		install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	fi
	if $(command -v bash &> /dev/null); then
		./topgrade --gen-completion bash > topgrade.bash
		install -Dm644 ./topgrade.bash  "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &> /dev/null); then
		./topgrade --gen-completion zsh > topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
}
