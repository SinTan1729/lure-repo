name='tree-sitter-cli'
version=0.26.11
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
checksums_amd64=('ff1b7f9863f2faafd78dc0e66d902ee85b37f709b314b22c009f51caf233eebd')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('db28509fe6db8902f9d14c43c486858c7486b42c3a96b30e811e73f105762336')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
