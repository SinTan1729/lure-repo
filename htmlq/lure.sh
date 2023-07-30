name='htmlq'
version=VERSION
release=2
desc='Like jq, but for HTML.'
homepage='https://github.com/mgdm/htmlq'
architectures=('amd64')
maintainer='SinTan1729'
license=('MIT')
provides=('htmlq')
conflicts=('htmlq')
git_repo='mgdm/htmlq'

sources=()
checksums=()

version() {
    printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name')"
}

package() {
    # Pull sources
    echo "Pulling ${name} ${version}"
    curl -L "https://github.com/${git_repo}/releases/latest/download/htmlq-x86_64-linux.tar.gz" -o ${name}.tar.gz
    # Build package
    echo "Creating the package"
    tar -xzf "${name}.tar.gz" -C .
    # Binaries
    install -Dm755 "./${name}" "${pkgdir}/usr/bin/${name}"
}
