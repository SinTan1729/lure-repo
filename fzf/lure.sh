name='fzf'
version=0.74.3
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
    '3501a595e4b5c40a6b047340a0e8f805c46fd4e61ef95ef8a136ba8c61cf6f22'
    '8d35453a6a2e146107fd7afdb88df970a9cff7388a09be36c9627f81608f2677'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '88e9e813a62e737ee1dc0bb638c171301bb1bc03edc363346fb7026b94280e50'
    'ded1ae60705242d85204714ee2268e0cac957a87ad0494afc453933cc4decc78'
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
    '4a17a17b46bd0c4873e995533de508995c11572c0be0664a5dbcf13f60463046'
    '8d35453a6a2e146107fd7afdb88df970a9cff7388a09be36c9627f81608f2677'
    'ae8cae867f9534557c0d8e1c21b795be2b199cb77487ddcd55ebdb8523a00c4c'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '88e9e813a62e737ee1dc0bb638c171301bb1bc03edc363346fb7026b94280e50'
    'ded1ae60705242d85204714ee2268e0cac957a87ad0494afc453933cc4decc78'
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
