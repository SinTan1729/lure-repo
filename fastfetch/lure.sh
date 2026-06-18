name='fastfetch'
version=2.64.2
release=1
desc='Like neofetch, but much faster because written in C.'
homepage='https://github.com/fastfetch-cli/fastfetch'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('APACHE-2.0' 'MIT')
provides=('fastfetch' 'flashfetch')
conflicts=('fastfetch' 'flashfetch')
git_repo='fastfetch-cli/fastfetch'

sources_amd64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-amd64.tar.gz")
checksums_amd64=('5dc341ec4853ddeb0c0efa62e033fed57b0a00f7d805ebb6d354241ca244aba5')
sources_arm64=("https://github.com/${git_repo}/releases/latest/download/${name}-linux-aarch64.tar.gz")
checksums_arm64=('f69dc4779dc65f48fa0c2d54d45ad7abbe5fcdf9b979c7104018b965400bcca7')

package() {
    [ $ARCH = arm64 ] && ARCH=aarch64
    # Build package
    mv -T "${srcdir}/fastfetch-linux-${ARCH}" ${pkgdir}
}
