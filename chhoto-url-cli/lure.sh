name="chhoto-url-cli"
version=0.1.0
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('6d1b862cba47abfb52b42af1630f85c783935451d4d78c2df0f1dc43fd257f66')
package() {
	# Binary
	install-binary "./${name}"
	# Manpage
	install-manual "./${name}.1"
}
