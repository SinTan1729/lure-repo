name='tree-sitter-cli'
version=0.27.1
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
checksums_amd64=('c7e686aec16ba17053c2e6fd87600ccb10cf8ba3d055756b17e756d538e11114')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-arm64.zip")
checksums_arm64=('3c0d0113cae3fea36f2336c271cbdacbcdb349edb006319155652b9386803c55')

package() {
    # Build package
    install-binary "${srcdir}/tree-sitter"
}
