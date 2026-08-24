name='tree-sitter-cli'
version=0.26.13
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
checksums_amd64=('1b781c0dc1dfefea44b5db2ec2a58440fe9d006856c3f5b3fd9a17119d1138a2')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('72c6d6c669c70491f93db290b285d9e85fd68ead9e324cc55ace35a1be66c3bd')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
