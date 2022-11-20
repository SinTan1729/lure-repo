name='bat'
version=v0.22.1
release=1
desc='A cat(1) clone with syntax highlighting and Git integration'
homepage='https://github.com/sharkdp/bat'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('bat')
conflicts=('bat')

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Eo '"tag_name": "v(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	echo Installing bat $version
	curl -L "https://github.com/sharkdp/bat/releases/download/$version/bat-$version-x86_64-unknown-linux-musl.tar.gz" -o bat.tar.gz
	tar xzvf "bat.tar.gz" -C .
	cd "./bat-$version-x86_64-unknown-linux-musl"
	install -Dm755 "./bat" "${pkgdir}/usr/local/bin/bat"
	install -Dm644 "./bat.1" "${pkgdir}/usr/local/share/man/man1/bat.1"
	install -Dm644 "./autocomplete/bat.fish" "${pkgdir}/usr/share/fish/completions/bat.fish"
	install -Dm644 "./autocomplete/bat.zsh" "${pkgdir}/usr/share/zsh/site-functions/_bat"
	install -Dm644 "./autocomplete/bat.bash" "${pkgdir}/usr/share/bash-completion/completions/bat"
}
 
