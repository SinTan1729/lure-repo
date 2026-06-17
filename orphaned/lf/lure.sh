name='lf'
version=VERSION
release=2
desc='A terminal file manager written in Go'
homepage='https://github.com/gokcehan/lf'
architectures=('all')
maintainer='SinTan1729'
license=('MIT')
provides=('lf')
conflicts=('lf')
git_repo='gokcehan/lf'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-linux-${ARCH}.tar.gz" -o ${name}.tar.gz
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/${name}.1" -o ${name}.1
	command -v fish &>/dev/null && curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.fish" -o ${name}.fish
	command -v zsh &>/dev/null && curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.zsh" -o ${name}.zsh
	command -v bash &>/dev/null && curl -L "https://raw.githubusercontent.com/${git_repo}/master/etc/${name}.bash" -o ${name}.bash
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
	# Autocomplete
	install-completion fish "${name}" <"./${name}.fish"
	install-completion zsh "${name}" <"./${name}.zsh"
	install-completion bash "${name}" <"./${name}.bash"
}
