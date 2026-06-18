name='linux-user-repository-bin'
version=0.1.3
release=1
desc='Linux User REpository'
homepage='https://lure.sh'
maintainer='SinTan1729 <mail@sayantansantra.co,a>'
architectures=('amd64' 'arm64' 'riscv64' 'arm' '386')
license=('GPL-3.0-or-later')
provides=('linux-user-repository')
conflicts=('linux-user-repository' 'linux-user-repository-bin' 'linux-user-repository-git')

sources_arm64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-aarch64.tar.gz")
checksums_arm64=('e1bcc6ba9d0fc7152c1b0254516c2902c369d0db2b0e412986f3d1970cdb4d66')

sources_arm=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-arm.tar.gz")
checksums_arm=('6ca6e4d942632e0413e254f99255435e53d82194519b905bfed719c55a355913')

sources_amd64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-x86_64.tar.gz")
checksums_amd64=('973ebba2cf176b33d498d9e82c95875f6440148831be37f921c0207d754f3ece')

sources_386=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-i386.tar.gz")
checksums_386=('b0d666aebe99588d9ffcee4ea017c11d921ee00315f1c2498ff4bcbb5f0b5fef')

sources_riscv64=("https://github.com/SinTan1729/lure/releases/download/${version}/lure-${version}-linux-riscv64.tar.gz")
checksums_riscv64=('f2d2d7f833dceb7c3fc4246bc8f6ee281449d8fec224a124019357e6d5035453')

package() {
    install-binary ./lure

    install-completion bash lure <"$srcdir/scripts/completion/bash"
    install-completion zsh lure <"$srcdir/scripts/completion/zsh"
}
