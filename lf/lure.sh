name='lf'
version=VERSION
release=1
desc='A terminal file manager written in Go'
homepage='https://github.com/gokcehan/lf'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('lf')
conflicts=('lf')
git_repo='gokcehan/lf'

sources=()
checksums=()

version() {
    printf "$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(r.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
}

package() {
	vers="$(curl --silent "https://api.github.com/repos/${git_repo}/releases/latest" | grep -Eo '"tag_name": "(r.*)"' | sed -E 's/.*"([^"]+)".*/\1/')"
	echo Installing ${name} ${vers}
	curl -L "https://github.com/${git_repo}/releases/download/${vers}/${name}-linux-${ARCH}.tar.gz" -o ${name}.tar.gz
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/${name}.1" -o ${name}.1
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.fish" -o ${name}.fish
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.zsh" -o ${name}.zsh
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.bash" -o ${name}.bash
	tar xzf "${name}.tar.gz" -C .
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	install -Dm644 "./${name}.1" "${pkgdir}/usr/local/share/man/man1/${name}.1"
	install -Dm644 "./${name}.fish" "${pkgdir}/usr/share/fish/completions/${name}.fish"
	install -Dm644 "./${name}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${name}"
	install -Dm644 "./${name}.bash" "${pkgdir}/usr/share/bash-completion/completions/${name}"
}
 