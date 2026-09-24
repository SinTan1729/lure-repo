name='linux-user-repository-bin'
version=0.2.1
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
checksums_arm64=('fc273e084946269fbd2a1746aa2250f9a525df72e92ecca20b4d4e8349955df2')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm=('e90156fbf2f429b372e819e9b0ec7e51191faff381ff5ed93111086b53ede17a')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_amd64=('9894be8717fc8b9e4db63c0f264a6b4ee7825c460d023579e2688b64c3c94f7c')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_386=('591d785e493981362ea8a731eed6e19121eea886c920434edf2e63ba168a5f2e')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_riscv64=('e17d93edc90817aed24837c036c563ce324479d256d5e8783866bed5c06e68a1')

package() {
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
