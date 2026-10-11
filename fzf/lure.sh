name='fzf'
version=0.74.5
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
    'd47d7f882972c7d674dbbba998ffa4116e68379616ffac7695d0671e9a722c5f'
    'cdffa16565ab4a55909cd4603e859b88ecacd242a818c07392bc085627984cf3'
    'ce0ba5acc4c6bf5b349349731ffd6e755fb403e08d30566daa75542f0d0c08b5'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '88e9e813a62e737ee1dc0bb638c171301bb1bc03edc363346fb7026b94280e50'
    '09d23692865ff9e960dd4f941e9e6dabf1cbb9733cfb5e2b30f247d613632a14'
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
    'cf058001da21724a469b714a29cf4aab9cbe860d218a0d6c1b5b661efad7784c'
    'cdffa16565ab4a55909cd4603e859b88ecacd242a818c07392bc085627984cf3'
    'ce0ba5acc4c6bf5b349349731ffd6e755fb403e08d30566daa75542f0d0c08b5'
    '263f7c4e602c002747175c69efa507bd3fb663633bb2419efda2e7641ffb6912'
    '89103adb2e29816b0ed8f36814ce4c95945a5f1c7dcd3b0620d2973ea2dbd6ea'
    '88e9e813a62e737ee1dc0bb638c171301bb1bc03edc363346fb7026b94280e50'
    '09d23692865ff9e960dd4f941e9e6dabf1cbb9733cfb5e2b30f247d613632a14'
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
    YELLOW='\033[0;33m'
    NC='\033[0m'
    echo -e "${YELLOW}For key-binding and completion to work with fish, some manual intervention is required"
    echo -e "Look here for instructions: https://wiki.archlinux.org/title/fzf#fish${NC}"
}
