name='croc'
version=11.6.3
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
    '4cd137020b4edad390b8a5b271a740d8605999d9e0a11927e1f6581ce2ab5675'
    'a3943808e7f9a26f4a94a2484797c00a6e2e9ede059e5b5f1619d3552f7a5a53'
    '7e703ee4a84621ea60aaccac4fc3dda909cb245ea8da6c8ee380acac80ea100b'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    '5d87a8a270b13cd2496c0264c137e59deda1cf558c604b596f806a33667359a9'
    'a3943808e7f9a26f4a94a2484797c00a6e2e9ede059e5b5f1619d3552f7a5a53'
    '7e703ee4a84621ea60aaccac4fc3dda909cb245ea8da6c8ee380acac80ea100b'
)

package() {
    # Binary
    install-binary croc
    # Autocomplete
    install-completion zsh croc <zsh_autocomplete
    install-completion bash croc <bash_autocomplete
}
