name='tree-sitter-cli'
version=0.27.0
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
checksums_amd64=('e4a3826bcd0fe099ee3a5617767374939cbc23c4a35b5b53f5fc04142525a2c1')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('6260b621bf5ab87027dfb463bf955504ef32cdcda62b81f28447753e48c83a62')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
