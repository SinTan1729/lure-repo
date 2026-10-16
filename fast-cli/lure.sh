name='fast-cli'
version=0.3.10
release=1
desc='Command line version of fast.com in ~1.2 MB'
homepage='https://github.com/mikkelam/fast-cli'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('fast-cli')
conflicts=('fast-cli')
git_repo='mikkelam/fast-cli'

sources_amd64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-x86_64-linux.tar.gz")
checksums_amd64=('8b957bcb82f79337350e020a2b15f3b655fab0c71b7bfe23d09e2bd17eae1a77')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-aarch64-linux.tar.gz")
checksums_arm64=('c45fb1be7986ac30247a43906c95d808614a48bb5489c01e155375ef63a38af0')

package() {
    install-binary "${srcdir}/fast-cli"
}
