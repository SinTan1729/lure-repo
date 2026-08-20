name='croc'
version=11.2.2
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
    'e4a35eb45a71d373f5e2470c1a8ba29fdf7bf1e5e79dc4d54b25ab5524fe0797'
    '2b0607bb21089e2c8ea8e5ce959875920bcbe20349c2e39a98bc56eba85bed00'
    'af140dc7b4dcff01c57a6eba723bd3dc431dc27663fa0861c4cd37c7335fb1ba'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    '54f6b1d252189a89c5468acdddc5c266a8156931179ae5ba4a9e16a2764d9290'
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
