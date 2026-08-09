name='tree-sitter-cli'
version=0.26.12
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
checksums_amd64=('c33ace12fa7a94d09c97054da621bf7a6a3159f765b1839a898232de283d641d')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('be970bfad7b557ffc62b1a7b4c92341a9c6e16d619e9880e43f07c4a4e6eb52a')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
