name='linux-user-repository-bin'
version=0.2.3
release=1
desc='Linux User REpository'
homepage='https://lure.sh'
maintainer='SinTan1729 <mail@sayantansantra.co,a>'
architectures=('amd64' 'arm64' 'riscv64' 'arm' '386')
license=('GPL-3.0-or-later')
provides=('linux-user-repository')
conflicts=('linux-user-repository' 'linux-user-repository-bin' 'linux-user-repository-git')
git_repo='SinTan1729/lure'

sources_arm64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm64=('239d1c423c6171696a2890cf8c63f22d1c9e266b71e3bfafcdbc2ab2eb1d68aa')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm=('3f63dbcf9bd9d36572f7a89bc1a71cf995f9be2a983f6e6670bffde6c8efce4f')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_amd64=('54812769351b30aab83f0c87a1ce4d67fd553aacdb3202031ba3afa4ae3e994e')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_386=('7787c9e707e2b28ac1b423c40bec7477a982c0947f092173750fac3174c6721e')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_riscv64=('42d18d902662746f970d6b71450d4fc3f51c3006775aa66a84ee4fc1242381f0')

package() {
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
