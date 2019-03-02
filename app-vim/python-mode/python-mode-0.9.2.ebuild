# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#VIM_PLUGIN_VIM_VERSION="7.0"
PYTHON_COMPAT=( python2_7 python3_6 )
inherit python-r1 vim-plugin

DESCRIPTION="vim plugin: Turn vim into a python IDE"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=3770 https://github.com/klen/python-mode"
SRC_URI="https://github.com/klen/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="PythonModeCommands"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI="https://github.com/klen/python-mode"
VIM_PLUGIN_MESSAGES="filetype"

RDEPEND="
	dev-python/astroid[${PYTHON_USEDEP}]
	dev-python/autopep8[${PYTHON_USEDEP}]
	dev-python/mccabe[${PYTHON_USEDEP}]
	dev-python/pycodestyle[${PYTHON_USEDEP}]
	dev-python/pyflakes[${PYTHON_USEDEP}]
	dev-python/pylama[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	dev-python/rope[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/snowballstemmer[${PYTHON_USEDEP}]
"

src_install() {
	vim-plugin_src_install
	insinto usr/share/${PN}
}
