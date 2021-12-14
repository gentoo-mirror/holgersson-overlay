# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua-single vim-plugin
COMMIT_ID="4edd1a7a51a9d7298706501066ead7e2c2703285"

DESCRIPTION="vim plugin: Quickstart configurations for the Nvim LSP client"
HOMEPAGE="https://github.com/neovim/nvim-lspconfig"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
IUSE="test"
REQUIRED_USE="${LUA_REQUIRED_USE}"
RESTRICT="test" # needs network access

if [[ ${PV} == *9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/neovim/${PN}.git"
else
	SRC_URI="https://github.com/neovim/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${COMMIT_ID}"
fi

BDEPEND="virtual/pkgconfig"
RDEPEND=">=app-editors/neovim-0.5.0"

DOCS=( README.md )

src_prepare(){
	default

	rm -r test || die
}

src_compile(){
	# Don't do anything. The Makefile just runs some tests that need
	# network access.
	echo
}

src_install(){
	# We need to get the major and minor version only.
	insinto /usr/share/lua/$(ver_cut 1-2 $(lua_get_version))
	doins -r lua/*
	rm -r lua || die
	vim-plugin_src_install
}