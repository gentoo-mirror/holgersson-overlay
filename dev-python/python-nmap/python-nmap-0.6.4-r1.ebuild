# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1

DESCRIPTION="A Python library which helps in using the nmap port scanner"
HOMEPAGE="https://xael.org/pages/python-nmap.html"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test" # this packages does not support any tests, so skip them

DEPEND="
	${PYTHON_DEPS}
	net-analyzer/nmap"
RDEPEND="${DEPEND}"
