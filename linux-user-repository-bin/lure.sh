name='linux-user-repository-bin'
version=0.2.0
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
checksums_arm64=('837916d48f1371891785dedf4dd07d9f610f8924f5fb0730b794e80a7b4d3f85')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm=('0ff0c505ce8abc66f6acad1d0a674966b9de65afc2dfc26fc45c3ddaf2a4da41')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_amd64=('4ea8aabab482b8b890d30f11571de94675dbac500bed5dfa79324b4630c9f788')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_386=('7e41d490b9a5760a5eb2d3d0fd6fd7e681d52f3e81ada3ae8716159eb261c869')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_riscv64=('5ac5d7175ceb8a4c509e720d0283fa514d304b0f54f88adb98735e6b6cb5ae74')

package() {
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
