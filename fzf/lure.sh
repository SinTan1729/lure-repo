name='fzf'
version=0.73.1
release=1
desc='A command-line fuzzy finder'
homepage='https://github.com/junegunn/fzf'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('fzf' 'fzf-tmux')
conflicts=('fzf' 'fzf-tmux')
git_repo='junegunn/fzf'

sources_amd64=(
    "https://github.com/${git_repo}/releases/latest/download/fzf-${version}-linux_${ARCH}.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/man/man1/${name}.1"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/completion.zsh"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/completion.bash"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.bash"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.zsh"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.fish"
)
checksums_amd64=(
    'f3252c2c366bc1700d3c85781ec8c9695998927ac127870eb049ceea2d540f8a'
    '78e69a7c384d5222cea8d93df7e91b5c225d51c913c44539beb895e799b38000'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    'a60ce8c33c7a5c91f8b9c1c6c00400b3fa10fd5df2e965d9370e476dfaf3f65c'
    '739df26921aba9a67c7f174403615e8e436258e4d53ce8aed5598299bffa4893'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/latest/download/fzf-${version}-linux_${ARCH}.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/man/man1/${name}.1"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/completion.zsh"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/completion.bash"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.bash"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.zsh"
    "https://raw.githubusercontent.com/${git_repo}/v${version}/shell/key-bindings.fish"
)
checksums_arm64=(
    'a408b0b6c08d486307b8f1554f967b8b50ee1b3ea8b4035e3161bab31fdfc28d'
    '78e69a7c384d5222cea8d93df7e91b5c225d51c913c44539beb895e799b38000'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    'a60ce8c33c7a5c91f8b9c1c6c00400b3fa10fd5df2e965d9370e476dfaf3f65c'
    '739df26921aba9a67c7f174403615e8e436258e4d53ce8aed5598299bffa4893'
)

package() {
    # Binaries
    install-binary "${srcdir}/${name}"
    # install-binary "${srcdir}/${name}-tmux"
    # Manpages
    install-manual "${srcdir}/${name}.1"
    # 	# install-manual "${srcdir}/${name}-tmux.1"
    # Autocomplete
    install-completion zsh "${name}" <"${srcdir}/completion.zsh"
    install-completion bash "${name}" <"${srcdir}/completion.bash"
    # Key-bindings
    command -v fish &>/dev/null && install -Dm644 key-bindings.fish "${pkgdir}/usr/share/fish/vendor_functions.d/${name}_key_bindings.fish"
    command -v bash &>/dev/null && install -Dm644 key-bindings.bash "${pkgdir}/usr/share/${name}/key-bindings.bash"
    command -v zsh &>/dev/null && install -Dm644 key-bindings.zsh "${pkgdir}/usr/share/${name}/key-bindings.zsh"
    # Notice
    echo "For key-binding and completion to work with fish, some manual intervention is required"
    echo "Look here for instructions: https://wiki.archlinux.org/title/fzf#fish"
}
