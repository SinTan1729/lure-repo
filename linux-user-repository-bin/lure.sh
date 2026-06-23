name='linux-user-repository-bin'
version=0.1.8
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
checksums_arm64=('8bc0c538b8123bfafc6e33d675a11089f135e3ee8a259e8ef55c2d704dd4ff24')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-arm.tar.gz")
checksums_arm=('300e509e1ac1c24112365bd450e54a3d4287fc01b597cde44bcf61517287c414')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-x86_64.tar.gz")
checksums_amd64=('215ef6842a9098059dde49ace961c191d86f22e4d24b09a8aeb91708b3ac2559')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-i386.tar.gz")
checksums_386=('8e5d72366071be3d8bd6370c4ea32a55e8c73d9629c6da687c0ed54ddd773462')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-riscv64.tar.gz")
checksums_riscv64=('2e790b42254d9f4fcc6a48f71950eade4003254b8c2240b5c64317f2d4596cdd')

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
    install-completion bash lure <"${srcdir}/completion/bash"
    install-completion zsh lure <"${srcdir}/completion/zsh"
}
