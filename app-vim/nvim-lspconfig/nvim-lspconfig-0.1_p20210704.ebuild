# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin
COMMIT_ID="5fe1b132534041e889278f081ff10c02b09c096f"

DESCRIPTION="vim plugin: Quickstart configurations for the Nvim LSP client"
HOMEPAGE="https://github.com/neovim/nvim-lspconfig"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="test" # need network access

if [[ ${PV} == *9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/neovim/${PN}.git"
else
	SRC_URI="https://github.com/neovim/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${COMMIT_ID}"
fi

BDEPEND=">app-editors/neovim-0.5.0"
DOCS=( README.md )

src_prepare(){
	default

	rm -rf test || die
}

src_compile(){
	# Don't do anything. The Makefile just runs some tests that need
	# network access.
	echo
}

src_install(){
	vim-plugin_src_install
}
