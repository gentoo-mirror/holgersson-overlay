# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Python Control Systems Library"
HOMEPAGE="https://python-control.readthedocs.io/ https://pypi.org/project/control/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	${DEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"