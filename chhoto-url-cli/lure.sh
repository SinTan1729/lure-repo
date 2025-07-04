name="chhoto-url-cli"
version=0.3.0
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('19e2cf675e10bc990e69642c7b901ccd2d90101b465095f793137aa13cad40de')
package() {
	# Binary
	install-binary "./chhoto"
	# Manpage
	install-manual "./chhoto.1"
}
