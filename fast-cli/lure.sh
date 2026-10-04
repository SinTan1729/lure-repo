name='fast-cli'
version=0.3.7
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
checksums_amd64=('279685f20d8e6ea1a1f649e6a8913a4959e163ceab68f8264eb758a1e7bc942e')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-aarch64-linux.tar.gz")
checksums_arm64=('816b1c216658ca7c3494c34ea3c738c321c609be7d2e359918bb88fb23f29797')

package() {
    install-binary "${srcdir}/fast-cli"
}
