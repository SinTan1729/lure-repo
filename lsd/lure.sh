name='lsd'
version=VERSION
release=1
desc='The next gen ls command'
homepage='https://github.com/Peltoche/lsd'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0')
provides=('lsd')
conflicts=('lsd')
git_repo="Peltoche/lsd"

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	vers="$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
	echo Installing ${name} ${vers}
	curl -L "https://github.com/${git_repo}/releases/download/${vers}/${name}-${vers}-x86_64-unknown-linux-musl.tar.gz" -o ${name}.tar.gz
	tar xzvf "${name}.tar.gz" -C .
	cd "./${name}-${vers}-x86_64-unknown-linux-musl"
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	install -Dm644 "./${name}.1" "${pkgdir}/usr/local/share/man/man1/${name}.1"
	install -Dm644 "./autocomplete/${name}.fish" "${pkgdir}/usr/share/fish/completions/${name}.fish"
	install -Dm644 "./autocomplete/_${name}" "${pkgdir}/usr/share/zsh/site-functions/_${name}"
	install -Dm644 "./autocomplete/${name}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${name}"
}
 