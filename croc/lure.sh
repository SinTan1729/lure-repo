name='croc'
version=10.4.4
release=1
desc='Easily and securely send things from one computer to another'
homepage='https://github.com/schollz/croc'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('croc')
conflicts=('croc')
git_repo='schollz/croc'

sources_amd64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-64bit.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_amd64=(
    '715e6d4756b18e2cafe2ceaf476989f8311ba4715d6008d73dd14b2cd8498334'
    '2b0607bb21089e2c8ea8e5ce959875920bcbe20349c2e39a98bc56eba85bed00'
    'af140dc7b4dcff01c57a6eba723bd3dc431dc27663fa0861c4cd37c7335fb1ba'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    '0b61d96bf7e25e7c45c92da29ca19237a820ec52d280892a24433f158bb00458'
    '2b0607bb21089e2c8ea8e5ce959875920bcbe20349c2e39a98bc56eba85bed00'
    'af140dc7b4dcff01c57a6eba723bd3dc431dc27663fa0861c4cd37c7335fb1ba'
)

package() {
    # Binary
    install-binary croc
    # Autocomplete
    install-completion zsh croc <zsh_autocomplete
    install-completion bash croc <bash_autocomplete
}
