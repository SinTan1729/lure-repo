name='linux-user-repository-bin'
version=0.2.4
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
checksums_arm64=('b8023fd665e21cc9ba568738d7645c09fac085193a694f10922f8496dab04b7a')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm=('c62ae4bd9575cab7505d546fb0a469c40dd7978e8be647826571f4c6fc27f12b')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_amd64=('b75a1d816bf65a9b683081e42c7a7cbe15fca949da04d262797294cb985921c7')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_386=('b6cc446c11b646ef24841274cfb60807f1db136d45cae919e7e343f405307f6f')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_riscv64=('e9505697b73245a6d315eb0b4ef357f92a0848ba3b36e0599ba19fc729f33ca3')

package() {
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
