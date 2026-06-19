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
    "https://raw.githubusercontent.com/${git_repo}/master/man/man1/${name}.1"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.zsh"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.bash"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.bash"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.zsh"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.fish"
)
checksums_amd64=(
    'f3252c2c366bc1700d3c85781ec8c9695998927ac127870eb049ceea2d540f8a'
    '6edcc7a0f292f53fe8880a630a5ec362a95ebf4cf27c4aa33b2aa22d7afc07a7'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '62b85bec366f739913f83e83d108b6100aa27d7cc9aec4d64479ae5dc5b93e76'
    'cc1f1b7ded58636ef1f748fbdf3b3889a75ebf665b0608d1384e20a7ab6dda50'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/latest/download/fzf-${version}-linux_${ARCH}.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/master/man/man1/${name}.1"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.zsh"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/completion.bash"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.bash"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.zsh"
    "https://raw.githubusercontent.com/${git_repo}/master/shell/key-bindings.fish"
)
checksums_arm64=(
    'a408b0b6c08d486307b8f1554f967b8b50ee1b3ea8b4035e3161bab31fdfc28d'
    '6edcc7a0f292f53fe8880a630a5ec362a95ebf4cf27c4aa33b2aa22d7afc07a7'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '62b85bec366f739913f83e83d108b6100aa27d7cc9aec4d64479ae5dc5b93e76'
    'cc1f1b7ded58636ef1f748fbdf3b3889a75ebf665b0608d1384e20a7ab6dda50'
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
