# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Library to read data from Mi Flora sensor"
HOMEPAGE="https://github.com/basnijholt/miflora https://pypi.org/project/miflora/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/bluepy[${PYTHON_USEDEP}]
	dev-python/btlewrap[${PYTHON_USEDEP}]
"
BDEPEND="
	${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test','test.*'])/g" setup.py || die
	default
}

distutils_enable_tests nose
distutils_enable_tests pytest