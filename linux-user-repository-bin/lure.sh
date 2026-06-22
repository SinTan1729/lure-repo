name='linux-user-repository-bin'
version=0.1.5
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
checksums_arm64=('48a8c2d51e7d9cf79fb79c82047dd54ae038fc47596182b328e7574555805c30')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-arm.tar.gz")
checksums_arm=('8fbad5135e5cfcb14e8d1dce6a96b4e0318ebc3d9dd2a9cb081c193121fb0288')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-x86_64.tar.gz")
checksums_amd64=('07d58ef8aa341cbc48bd14d8f035f29b97cc52a936958df5de6c8d0234455af8')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-i386.tar.gz")
checksums_386=('a5fac1477b3c4a96fc9ce60da582a6d5e9a9a5a39c0c35d51ac7477e1ffffa49')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-riscv64.tar.gz")
checksums_riscv64=('ee6b3f6e2b58ec6e6d3389a611fbc7a5c7bb9bcaac541760d1fcb0b49f76943f')

package() {
    cp -l ${srcdir}/lure-${version}-* "${srcdir}/lure"
    install-binary ${srcdir}/lure

    install-completion bash lure <"${srcdir}/scripts/completion/bash"
    install-completion zsh lure <"${srcdir}/scripts/completion/zsh"
}
