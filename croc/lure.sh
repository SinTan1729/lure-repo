name='croc'
version=11.3.6
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
    'bd18e01024f5ccc8e101c08c8233d4cffbfda4ff59acad80eaa1fc2963efc0b2'
    '2b0607bb21089e2c8ea8e5ce959875920bcbe20349c2e39a98bc56eba85bed00'
    'af140dc7b4dcff01c57a6eba723bd3dc431dc27663fa0861c4cd37c7335fb1ba'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    'c26ac67207301ed75ae0ece63796ec8a2a002b1cf64f4e3d3d8e7bcee508b5b3'
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
