name="chhoto-url-cli"
version=0.2.0
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('bddbdec017b984eb24f8d73d81f7b482d434cae7e9b238de9725ad2349eb0fc9')
package() {
	# Binary
	install-binary "./chhoto"
	# Manpage
	install-manual "./chhoto.1"
}
