# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit vim-plugin

COMMIT_ID="fe9d3e1a9a50171e7d316a52e1e56d868e4c1fe5"

DESCRIPTION="vim plugin: mksession automation tool"
HOMEPAGE="https://www.vim.org/scripts/script.php?script_id=4472 https://github.com/tpope/vim-obsession"
LICENSE="vim"
IUSE="test"
RESTRICT="!test? ( test )"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tpope/vim-obsession.git"
else
	if [[ ${PV} == *_p* ]]; then
		SRC_URI="https://github.com/tpope/vim-obsession/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/vim-obsession-${COMMIT_ID}"
	else
		SRC_URI="https://github.com/tpope/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	fi
fi
KEYWORDS="~amd64 ~x86"

DOCS=(
	README.markdown
	CONTRIBUTING.markdown
)
