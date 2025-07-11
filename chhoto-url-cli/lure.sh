name="chhoto-url-cli"
version=0.4.3
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('f1c4caab314257eeec65ed07b02c490630abda9b8debbc1d413c8f4b4c79e6d0')
package() {
	# Binary
	install-binary "./chhoto"
	# Manpage
	install-manual "./chhoto.1"
}
