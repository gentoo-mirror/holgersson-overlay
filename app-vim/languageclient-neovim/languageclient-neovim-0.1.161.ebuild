# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-0.2.3
aho-corasick-0.7.13
anyhow-1.0.32
arc-swap-0.4.7
arrayref-0.3.6
arrayvec-0.5.1
autocfg-1.0.0
base64-0.11.0
base64-0.12.3
bitflags-1.2.1
blake2b_simd-0.5.10
cfg-if-0.1.10
chrono-0.4.13
clap-2.33.1
cloudabi-0.0.3
constant_time_eq-0.1.5
crc32fast-1.2.0
crossbeam-0.7.3
crossbeam-channel-0.4.3
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.3
crossbeam-utils-0.7.2
derivative-2.1.1
diff-0.1.12
dirs-2.0.2
dirs-sys-0.3.5
dtoa-0.4.6
either-1.5.3
filetime-0.2.10
flate2-1.0.16
fnv-1.0.7
fsevent-0.4.0
fsevent-sys-2.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
getrandom-0.1.14
glob-0.3.0
humantime-1.3.0
idna-0.2.0
inotify-0.7.1
inotify-sys-0.1.3
iovec-0.1.4
itertools-0.9.0
itoa-0.4.6
json-patch-0.2.6
jsonrpc-core-15.1.0
kernel32-sys-0.2.2
lazy_static-1.4.0
lazycell-1.2.1
libc-0.2.73
linked-hash-map-0.5.3
lock_api-0.3.4
log-0.4.11
log-mdc-0.1.0
log4rs-0.12.0
lsp-types-0.83.0
maplit-1.0.2
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.3.3
memoffset-0.5.5
miniz_oxide-0.4.0
mio-0.6.22
mio-extras-2.0.6
miow-0.2.1
net2-0.2.34
notify-4.0.15
num-integer-0.1.43
num-traits-0.2.12
ordered-float-1.1.0
parking_lot-0.10.2
parking_lot_core-0.7.2
pathdiff-0.2.0
percent-encoding-2.1.0
pin-project-lite-0.1.11
proc-macro2-1.0.19
quick-error-1.2.3
quote-1.0.7
redox_syscall-0.1.57
redox_users-0.3.4
regex-1.3.9
regex-syntax-0.6.18
rust-argon2-0.7.0
ryu-1.0.5
same-file-1.0.6
scopeguard-1.1.0
serde-1.0.114
serde-value-0.6.0
serde_derive-1.0.114
serde_json-1.0.56
serde_repr-0.1.6
serde_yaml-0.8.13
shellexpand-2.0.0
slab-0.4.2
smallvec-1.4.1
syn-1.0.35
textwrap-0.11.0
thiserror-1.0.20
thiserror-impl-1.0.20
thread-id-3.3.0
thread_local-1.0.1
time-0.1.43
tinyvec-0.3.3
tracing-0.1.21
tracing-attributes-0.1.11
tracing-core-0.1.17
tracing-log-0.1.1
traitobject-0.1.0
treediff-3.0.2
typemap-0.3.3
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-width-0.1.8
unicode-xid-0.2.1
unsafe-any-0.4.2
url-2.1.1
walkdir-2.3.1
wasi-0.9.0+wasi-snapshot-preview1
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
yaml-rust-0.4.4
"

inherit cargo vim-plugin

MY_PN="LanguageClient-neovim"

DESCRIPTION="neovim plugin: LSP client written in Rust"
HOMEPAGE="https://github.com/autozimu/LanguageClient-neovim"
SRC_URI="
	https://github.com/autozimu/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"
LICENSE="0BSD Apache-2.0 MIT BSD BSD-2 CC0-1.0 ZLIB"
KEYWORDS="~amd64"
SLOT="0"
IUSE="test"
RESTRICT="
	!test? ( test )
	mirror
"
S="${WORKDIR}/${MY_PN}-${PV}"

BDEPEND="dev-lang/rust[rls]"

DOCS=( CHANGELOG.md README.md )

src_install() {
	rm -rf tests || die
	cargo_src_install
	vim-plugin_src_install
}
