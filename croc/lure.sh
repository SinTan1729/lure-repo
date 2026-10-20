name='croc'
version=11.5.5
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
    '2dee9b7ede849971532c597ef3fd29507bfc970330758cfed13657be04f34243'
    'a3943808e7f9a26f4a94a2484797c00a6e2e9ede059e5b5f1619d3552f7a5a53'
    '7e703ee4a84621ea60aaccac4fc3dda909cb245ea8da6c8ee380acac80ea100b'
)
sources_arm64=(
    "https://github.com/${git_repo}/releases/download/v${version}/croc_v${version}_Linux-ARM64.tar.gz"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/bash_autocomplete"
    "https://raw.githubusercontent.com/${git_repo}/main/src/install/zsh_autocomplete"
)
checksums_arm64=(
    'c8606c6b4450e4a50b3ef25bd486ed4f9fa4a1ac6e2ecefb2bcbdbbfce1a51a9'
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
