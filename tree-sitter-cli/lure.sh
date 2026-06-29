name='tree-sitter-cli'
version=0.26.10
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
checksums_amd64=('5aca1172aae08050d0d1184046377d850c04065205185ebafde361afff8d9f62')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('6a455e6c0c21ddb732d182e3c46e3a8ca1121718254ce684a9dc730ff2367e02')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
