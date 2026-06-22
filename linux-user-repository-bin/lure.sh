name='linux-user-repository-bin'
version=0.1.6
release=1
desc='Linux User REpository'
homepage='https://lure.sh'
maintainer='SinTan1729 <mail@sayantansantra.co,a>'
architectures=('amd64' 'arm64' 'riscv64' 'arm' '386')
license=('GPL-3.0-or-later')
provides=('linux-user-repository')
conflicts=('linux-user-repository' 'linux-user-repository-bin' 'linux-user-repository-git')
git_repo='SinTan1729/lure'

sources_arm64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-aarch64.tar.gz")
checksums_arm64=('06dab260fe36e7385024d6bbc8961c148aa6348b552cfdeceb6e4093b49abef8')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-arm.tar.gz")
checksums_arm=('6cd27070e378a1e7208d36613604c7da5f54b1caf7c985ae72b021c22cde3b7b')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-x86_64.tar.gz")
checksums_amd64=('06757902d3d5ae0e7b364e7dbe31dc9b882c8c390ba3c60ca8c6a1312de085b9')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-i386.tar.gz")
checksums_386=('637c7c8fdd12d96a9ac572d2f6c1bf11ded1d449644c86cc389b3510619f3c1b')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-riscv64.tar.gz")
checksums_riscv64=('d11e2964ab615d3857c719d0e5cd8226fd7f0ef0e34918c845d733e93d26e95d')

package() {
    cp -l ${srcdir}/lure-${version}-* "${srcdir}/lure"
    install-binary ${srcdir}/lure

    install-completion bash lure <"${srcdir}/scripts/completion/bash"
    install-completion zsh lure <"${srcdir}/scripts/completion/zsh"
}
