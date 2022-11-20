name='bat'
version=VERSION
release=1
desc='A cat(1) clone with syntax highlighting and Git integration'
homepage='https://github.com/sharkdp/bat'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('bat')
conflicts=('bat')
git_repo='sharkdp/bat'

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "v(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	vers="$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "v(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
	echo Installing ${name} ${vers}
	curl -L "https://github.com/${git_repo}/releases/download/${vers}/${name}-${vers}-x86_64-unknown-linux-musl.tar.gz" -o ${name}.tar.gz
	tar xzf "${name}.tar.gz" -C .
	cd "./${name}-${vers}-x86_64-unknown-linux-musl"
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	install -Dm644 "./${name}.1" "${pkgdir}/usr/local/share/man/man1/${name}.1"
	command -v fish &> /dev/null && install -Dm644 "./autocomplete/${name}.fish" "${pkgdir}/usr/share/fish/completions/${name}.fish"
	command -v zsh &> /dev/null && install -Dm644 "./autocomplete/${name}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${name}"
	command -v bash &> /dev/null && install -Dm644 "./autocomplete/${name}.bash" "${pkgdir}/usr/share/bash-completion/completions/${name}"
}
 