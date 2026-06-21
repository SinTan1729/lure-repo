name='cockpit-zfs-manager'
version=1.3.1
release=1
desc='Cockpit plugin for managing ZFS'
homepage='https://github.com/45Drives/cockpit-zfs-manager'
architectures=('amd64')
maintainer='SinTan1729'
build_deps=('rsync')
license=('LGPL-3.0')
provides=('cockpit-zfs-manager')
conflicts=('cockpit-zfs-manager')
git_repo='45Drives/cockpit-zfs-manager'

sources=("https://github.com/${git_repo}/archive/refs/tags/v${version}.tar.gz")
checksums=('859bb2b3d459ef959d1ef85f4eab21354a92edbabcf0932f04523d972fccc6bf')

package() {
    # Install cockpit plugin files
    mkdir -p ${pkgdir}/usr/share/cockpit
    cp -r "${srcdir}/cockpit-zfs-manager-${version}/zfs" "${pkgdir}/usr/share/cockpit/"

    # Install required fonts
    tar --no-same-user -xJf ${scriptdir}/fonts.tar.xz
    rsync -aA fonts/ ${pkgdir}/
}
