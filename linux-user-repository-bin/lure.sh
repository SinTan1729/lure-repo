name='linux-user-repository-bin'
version=0.2.2
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
checksums_arm64=('ee3ef8b3ae4caacad8089361abe949363719504bf8bd5a7d2ed7fd6094669abe')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_arm=('91c1b51edac1f9706ec4a904a03588b16099c9ad7e8f19a887fcbeaa722725cc')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_amd64=('25e3c860ed378898b3368b749d68357598c89798122a28522dcef1779998d3c0')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_386=('b7a77073471152b35070e30d0e2e0f1dec2e04a5a93dac0c8c1b8b5e48d24da1')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-v${version}-linux-${ARCH}.tar.gz")
checksums_riscv64=('bad39e9ba1f939c25e3d044ee75d17a7c64879cc8abb48bd0d153e0055502cef')

package() {
    workdir="${srcdir}/lure-v${version}-linux-${ARCH}"
    install-binary ${workdir}/lure
    install-manual "${workdir}/misc/man/lure.1"
    install-completion bash lure <"${workdir}/misc/completion/lure.bash"
    install-completion fish lure <"${workdir}/misc/completion/lure.fish"
    install-completion zsh lure <"${workdir}/misc/completion/_lure"
}
