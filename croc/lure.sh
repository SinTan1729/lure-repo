name='croc'
version=VERSION
release=1
desc='Easily and securely send things from one computer to another'
homepage='https://github.com/schollz/croc'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('croc')
conflicts=('croc')
git_repo='schollz/croc'

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}_${version:1}_Linux-64bit.tar.gz" -o ${name}.tar.gz
	# Build package
	echo Creating the package
	tar -xzf "${name}.tar.gz" -C .
	# Binary
	install -Dm755 "./${name}" "${pkgdir}/usr/local/bin/${name}"
	# Autocomplete
	command -v zsh &> /dev/null && install -Dm644 "./zsh_autocomplete" "${pkgdir}/usr/share/zsh/site-functions/_${name}"
	command -v bash &> /dev/null && install -Dm644 "./bash_autocomplete" "${pkgdir}/usr/share/bash-completion/completions/${name}"
}
 