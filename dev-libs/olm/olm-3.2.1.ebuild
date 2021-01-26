# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Implementation of the olm and megolm cryptographic ratchets"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm"
SRC_URI="https://gitlab.matrix.org/matrix-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc test"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	local -a mycmakeargs=(
		-DOLM_TESTS="$(usex test)"
	)

	cmake_src_configure
}

src_test() {
	BUILD_DIR="${BUILD_DIR}/tests" cmake_src_test
}

src_install() {
	use doc && DOCS=( README.md docs/{{,meg}olm,signing}.md )

	cmake_src_install
}
