# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

COMMIT_ID=""

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Run docker-compose files without root with podman"
HOMEPAGE="https://pypi.org/project/podman-compose/ https://github.com/containers/podman-compose"

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/containers/podman-compose.git"
	inherit git-r3
else
	if [[ ${PV} == *_p* ]]; then
		SRC_URI="https://github.com/containers/podman-compose/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/podman-compose-${COMMIT_ID}"
	else
		SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	fi
fi
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	app-containers/podman
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	!app-emulation/podman-compose
"
