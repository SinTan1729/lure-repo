name='tree-sitter-cli'
_name='tree-sitter'
version=VERSION
release=1
desc='An incremental parsing system for programming tools'
homepage='https://github.com/tree-sitter/tree-sitter'
architectures=('amd64' 'arm64')
maintainer='SinTan1729'
license=('MIT')
provides=('tree-sitter')
conflicts=('tree-sitter')
git_repo='tree-sitter/tree-sitter'

sources=()
checksums=()

version() {
	printf "$(curl -sL "https://api.github.com/repos/${git_repo}/releases/latest" | jq -r '.tag_name | ltrimstr("v")')"
}

package() {
	# Pull sources
	echo Pulling ${name} ${version}
	[ ${ARCH} == "amd64" ] && ARCH="x64"
	curl -L "https://github.com/${git_repo}/releases/latest/download/${name}-linux-${ARCH}.zip" -o ${name}.zip
	# Build package
	echo Creating the package
	unzip "${name}.zip"
	install-binary "./${_name}"
}
