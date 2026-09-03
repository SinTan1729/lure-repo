name='fast-cli'
version=0.3.5
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
checksums_amd64=('0973a2e5ff552fb2bd0b64359101f919ff22086aafd7be571aa9d2289295bbc4')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-aarch64-linux.tar.gz")
checksums_arm64=('e0bd40ca25027721466c59c1752630f911a8d5efdbfe39d7ef348143340a7664')

package() {
    install-binary "${srcdir}/fast-cli"
}
