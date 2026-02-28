name='cockpit-zfs-manager'
version=VERSION
release=1
desc='Cockpit plugin for managing ZFS'
homepage='https://github.com/45Drives/cockpit-zfs-manager'
architectures=('amd64')
maintainer='SinTan1729'
build_deps=('rsync' 'curl')
license=('LGPL-3.0')
provides=('cockpit-zfs-manager')
conflicts=('cockpit-zfs-manager')
git_repo='45Drives/cockpit-zfs-manager'

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
    echo Pulling ${name}

    # Download latest source tarball
    curl -L "https://github.com/${git_repo}/archive/refs/tags/$version.tar.gz" -o ${name}.tar.gz

    echo Creating the package
    mkdir -p tmpdir
    tar -xf "${name}.tar.gz" -C tmpdir

    # Install cockpit plugin files
    mkdir -p ${pkgdir}/usr/share/cockpit
    cp -r tmpdir/cockpit-zfs-manager-${version:1}/zfs ${pkgdir}/usr/share/cockpit/

    # Install required fonts
    tar -xJf ${scriptdir}/fonts.tar.xz
    rsync -aA fonts/ ${pkgdir}/
}
