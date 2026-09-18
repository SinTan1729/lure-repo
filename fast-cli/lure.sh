name='fast-cli'
version=0.3.6
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
checksums_amd64=('a0440a35267687959a1cf92b4f98d400471ffcac2ab2e8034b9f69abfea07397')
sources_arm64=("https://github.com/${git_repo}/releases/download/v${version}/fast-cli-aarch64-linux.tar.gz")
checksums_arm64=('78aeae6dfa3c9e7ae263c567b77d6707f9dd51c2761205be61cb76f5ff5ed704')

package() {
    install-binary "${srcdir}/fast-cli"
}
