name='linux-user-repository-bin'
version=0.1.7
release=1
desc='Linux User REpository'
homepage='https://lure.sh'
maintainer='SinTan1729 <mail@sayantansantra.co,a>'
architectures=('amd64' 'arm64' 'riscv64' 'arm' '386')
license=('GPL-3.0-or-later')
provides=('linux-user-repository')
conflicts=('linux-user-repository' 'linux-user-repository-bin' 'linux-user-repository-git')
git_repo='SinTan1729/lure'

sources_arm64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-aarch64.tar.gz")
checksums_arm64=('a6ef221382be668c00887d6d90be4bf67298a4a8b91b84b801c4851d61beb294')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-arm.tar.gz")
checksums_arm=('682c4cbcaee362ba3a274eb21c955cd2410932ad93e1d622ef7dfeab41348964')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-x86_64.tar.gz")
checksums_amd64=('84aaf352ff68b6f85cce150b5e0a83c30f300a7c0a1588d11c953d68f01e5c50')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-i386.tar.gz")
checksums_386=('40b429ad988e5a9f30b3700d94a7f58c97caf475e837bbf4d1dee81c4c24ba24')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-riscv64.tar.gz")
checksums_riscv64=('7fce76405a54656a1bf2e5d8364c6b06c7f2163067940e3b1f4114d838130e94')

package() {
    case $ARCH in
    arm64)
        tmp_arch=aarch64
        ;;
    amd64)
        tmp_arch=x86_64
        ;;
    386)
        tmp_arch=i386
        ;;
    *)
        tmp_arch=$ARCH
        ;;
    esac
    cp -l "${srcdir}/lure-v${version}-linux-${tmp_arch}" "${srcdir}/lure"
    install-binary ${srcdir}/lure

    install-manual "${srcdir}/lure.1"
    install-completion bash lure <"${srcdir}/scripts/completion/bash"
    install-completion zsh lure <"${srcdir}/scripts/completion/zsh"
}
