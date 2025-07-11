name="chhoto-url-cli"
version=0.4.3
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('c511f0fcdeaba8c43e24f8b96c1eda11efa96ff18d26378f88b46fe7cf596b38')
package() {
	# Binary
	install-binary "./chhoto"
	# Manpage
	install-manual "./chhoto.1"
}
