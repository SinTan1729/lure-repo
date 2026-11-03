name='linux-user-repository-bin'
version=0.2.5
release=1
desc='Linux User REpository'
homepage='https://lure.sh'
maintainer='SinTan1729 <mail@sayantansantra.co,a>'
architectures=('amd64' 'arm64' 'riscv64' 'arm' '386' 'arm5' 'arm6')
license=('GPL-3.0-or-later')
provides=('linux-user-repository')
conflicts=('linux-user-repository' 'linux-user-repository-bin' 'linux-user-repository-git')
git_repo='SinTan1729/lure'

sources_arm64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-arm64.tar.gz")
checksums_arm64=('90c6312d20bab07c148402ad0dd1163480253b34a7ee01bd28ff2295fdb5f65b')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-armv7.tar.gz")
checksums_arm=('098abbd39abc4636f85b9070b3b4cdca20ba29fd7e7f95f8e802621288beaaf7')

sources_arm5=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-armv5.tar.gz")
checksums_arm5=('6bcc05f87090d037bcf114b6cae55a89a0584585aab67a04bc07c7a5fc4ae518')

sources_arm6=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-armv6.tar.gz")
checksums_arm6=('992a06d2e49d6f99275b20d07d682d49a59df89b850ee041ee4997a089d090a2')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-x86_64.tar.gz")
checksums_amd64=('6d3bf1f80813c8a9543f7e6c719707df47e4c84c32e7d628e2b65408dcfb902e')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-i686.tar.gz")
checksums_386=('3ad721490aaf59ef6579f2792eb36782bcee8308c34ebaf37cdf2954891ba7c0')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-riscv64.tar.gz")
checksums_riscv64=('eaf1479f14d988895305016a19db103240184c0497f61f3753e4979dd2a76c0b')

package() {
    case "$ARCH" in
    "amd64") ARCH="x86_64" ;;
    "arm") ARCH="armv7" ;;
    "386") ARCH="i686" ;;
    esac
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
