name='bat'
version=VERSION
release=2
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
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-${version}-x86_64-unknown-linux-musl.tar.gz" -o ${name}.tar.gz
	# Build package
	echo Creating the package
	tar -xzf "${name}.tar.gz" -C .
	cd "./${name}-${version}-x86_64-unknown-linux-musl"
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
	# Autocomplete
	install-completion fish <"./autocomplete/${name}.fish"
	install-completion zsh "./autocomplete/${name}.zsh"
	install-completion bash "./autocomplete/${name}.bash"
}
