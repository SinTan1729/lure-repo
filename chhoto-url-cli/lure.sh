name="chhoto-url-cli"
version=0.4.0
release=1
desc="A CLI tool to be used to interact with Chhoto URL."
architectures=('amd64')
homepage='https://github.com/SinTan1729/chhoto-url-cli'
license=('MIT')
provides=('chhoto')
sources_amd64=("${homepage}/releases/download/${version}/chhoto.tar.gz")
checksums_amd64=('f36b0d80956ccb7c3bfaff996c629d29e9cc91cd787b11628a3e08efe9b68eab')
package() {
	# Binary
	install-binary "./chhoto"
	# Manpage
	install-manual "./chhoto.1"
}
