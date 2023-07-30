name='sejda-console'
version=3.2.85
release=3
desc='Shell interface for performing pdf manipulations'
homepage='https://www.sejda.org'
architectures=('all')
maintainer='SinTan1729'
license=('AGPL3')
provides=('sejda-console')
deps=('jre-openjdk-headless>=1.8')
deps_opensuse=('java-17-openjdk-headless')
git_repo='torakiki/sejda'

sources=("https://github.com/${git_repo}/releases/download/v${version}/${name}-${version}-bin.zip?~archive=false")
checksums=('a2380aff1904103317a92b61a2008e2018184de0a7ed58e2516bd1b3818a48bf')

package() {
	# Build package
	echo "Creating the package"
	unzip -qq ${name}-${version}-bin.zip
	# Binary
	mkdir -p ${pkgdir}/opt
	cp -r ${name}-${version} ${pkgdir}/opt/sejda-console/
	rm ${pkgdir}/opt/${name}/bin/${name}.bat
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/${name}/bin/${name}  ${pkgdir}/usr/bin/
}
 
