name='lsd'
version=VERSION
release=2
desc='The next gen ls command'
homepage='https://github.com/Peltoche/lsd'
architectures=('amd64')
maintainer='SinTan1729'
license=('APACHE-2.0')
provides=('lsd')
conflicts=('lsd')
git_repo='Peltoche/lsd'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-${version}-x86_64-unknown-linux-musl.tar.gz" -o ${name}.tar.gz
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
	cd "./${name}-${version}-x86_64-unknown-linux-musl"
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
	# Autocomplete
	install-completion fish "${name}" <"./autocomplete/${name}.fish"
	install-completion zsh "${name}" <"./autocomplete/_${name}"
	install-completion bash "${name}" <"./autocomplete/${name}.bash-completion"
}
