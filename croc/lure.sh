name='croc'
version=VERSION
release=2
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
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}_${version}_Linux-64bit.tar.gz" -o ${name}.tar.gz
	# Build package
	echo Creating the package
	tar -xzf "${name}.tar.gz" -C .
	# Binary
	install-binary "./${name}"
	# Autocomplete
	curl -L "https://raw.githubusercontent.com/$git_repo/main/src/install/bash_autocomplete" -o "bash_autocomplete"
	curl -L "https://raw.githubusercontent.com/$git_repo/main/src/install/zsh_autocomplete" -o "zsh_autocomplete"
	install-completion zsh "${name}" <"./zsh_autocomplete"
	install-completion bash "${name}" <"./bash_autocomplete"
}
