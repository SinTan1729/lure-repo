name='linux-user-repository-bin'
version=0.1.4
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
checksums_arm64=('3091605ca10acd1b2c82b68015efda3b259ce9b872ca53ebccd383164bde737d')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-arm.tar.gz")
checksums_arm=('4b6c91a6417a0aeeb7156f4d9fedc8eccd7c94c5ece94858773d834c7f7264c3')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-x86_64.tar.gz")
checksums_amd64=('90e0ac334d20545787186edc906b120abecb453d29771fd2bdef0b00571eecd8')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-i386.tar.gz")
checksums_386=('a084ac420a828ca0768ee0dbf3353e805ae953b8b39e6bcb0960b9bd45778e0b')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-riscv64.tar.gz")
checksums_riscv64=('5970a9e914cb482b136794874d6589b462b83b56fcda5a9106914d037cdd6b2b')

package() {
    cp -l $srcdir/lure-${version}-* "$srcdir/lure"
    install-binary ./lure

    install-completion bash lure <"$srcdir/scripts/completion/bash"
    install-completion zsh lure <"$srcdir/scripts/completion/zsh"
}
