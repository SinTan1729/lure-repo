name='fzf'
version=VERSION
release=3
desc='A command-line fuzzy finder'
homepage='https://github.com/junegunn/fzf'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('fzf' 'fzf-tmux')
conflicts=('fzf' 'fzf-tmux')
git_repo='junegunn/fzf'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name' | cut -c 2-)"
}

package() {
	# Pull sources
	echo "Pulling ${name} ${version}"
	curl -L "https://github.com/${git_repo}/releases/latest/download/fzf-${version}-linux_amd64.tar.gz" -o ${name}.tar.gz
	# curl -L "https://raw.githubusercontent.com/${git_repo}/master/bin/${name}-tmux" -o ${name}-tmux
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/man/man1/${name}.1" -o ${name}.1
	# curl -L "https://raw.githubusercontent.com/${git_repo}/master/man/man1/${name}-tmux.1" -o ${name}-tmux.1
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.bash" -o ${name}.bash
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.zsh" -o ${name}.zsh
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.bash" -o key-bindings.zsh
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.zsh" -o key-bindings.bash
	curl -L "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.fish" -o key-bindings.fish
	# Build package
	echo "Creating the package"
	tar -xzf "${name}.tar.gz" -C .
	# Binaries
	install-binary "./${name}"
	# install-binary "./${name}-tmux"
	# Manpages
	install-manual "./${name}.1"
	# 	# install-manual "./${name}-tmux.1"
	# Autocomplete
	install-completion zsh "${name}" <"./${name}.zsh"
	install-completion bash "${name}" <"./${name}.bash"
	# Key-bindings
	command -v fish &>/dev/null && install -Dm644 key-bindings.fish "${pkgdir}/usr/share/fish/vendor_functions.d/${name}_key_bindings.fish"
	command -v bash &>/dev/null && install -Dm644 key-bindings.bash "${pkgdir}/usr/share/${name}/key-bindings.bash"
	command -v zsh &>/dev/null && install -Dm644 key-bindings.zsh "${pkgdir}/usr/share/${name}/key-bindings.zsh"
	# Notice
	echo "For key-binding and completion to work with fish, some manual intervention is required"
	echo "Look here for instructions: https://wiki.archlinux.org/title/fzf#fish"
}
