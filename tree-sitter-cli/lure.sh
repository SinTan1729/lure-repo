name='tree-sitter-cli'
version=0.27.2
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
checksums_amd64=('b4233ecc4f0e648d6d8ccc4bac96c00c712ca1a5eb1e0ca7197d29b750bffa6d')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('4598875d129dfef384b3d78da329b766f151c2f827404fb5f3363a135935d0d3')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
