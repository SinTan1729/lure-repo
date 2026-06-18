name='tree-sitter-cli'
version=0.26.9
release=1
desc='An incremental parsing system for programming tools'
homepage='https://github.com/tree-sitter/tree-sitter'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('tree-sitter')
conflicts=('tree-sitter')
git_repo='tree-sitter/tree-sitter'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-x64.zip")
checksums_amd64=('0ea5daaef79145fe73786f0e3cdc43b62b22ddb36f7f6676c9f8bb72434d78e9')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('8b6c0f53593ce17c7eb90eb08de5ffb9f513f3db585b1fbef12219cacf7e8a68')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
