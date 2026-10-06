name='fast-cli'
version=0.3.9
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
checksums_amd64=('4b5cf42c4f5a143272ef2619045ec54e5532c3700af65b2fe490bcf6b133b75d')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-aarch64-linux.tar.gz")
checksums_arm64=('b0dac8e5000b4af24ca2789c6a2f9ebe3eb3fcfefde9ea515ebfcc323d99e9c7')

package() {
    install-binary "${srcdir}/fast-cli"
}
