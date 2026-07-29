name='croc'
version=10.7.0
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
    '58ac4e1cc6f47e5982d08936b6484456286bfbdb4bc47e13b6894674a5f1ddca'
    '2b0607bb21089e2c8ea8e5ce959875920bcbe20349c2e39a98bc56eba85bed00'
    'af140dc7b4dcff01c57a6eba723bd3dc431dc27663fa0861c4cd37c7335fb1ba'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    '1607e11c0a6304d6e88b201f015daa8a87d9d8696b4dd728c4e95c4fbd6f7f89'
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
