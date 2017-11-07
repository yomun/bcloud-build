# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# /usr/portage/header.txt
EAPI=5
# PYTHON_COMPAT=( python2_7 python3_5 )
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
PYTHON_REQ_USE="sqlite"

inherit python-single-r1

DESCRIPTION="Baidu Pan client for Linux Desktop users"
HOMEPAGE="https://github.com/yomun/bcloud-build"

# SRC_URI="https://pypi.python.org/packages/source/b/${PN}/${P}.tar.gz"
SRC_URI=("https://pypi.python.org/packages/cf/c0/4387bafe301eb91514b6687af544f79989e34a7dbf8f36d9f35cac4ef036/bcloud-3.9.1.tar.gz")
# SRC_URI="file:///usr/local/portage/app-misc/bcloud/bcloud-3.9.1.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	dev-python/pygobject:3
	x11-themes/gnome-icon-theme-symbolic
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}] 
	dev-python/pycrypto[${PYTHON_USEDEP}]
	x11-libs/libnotify
	"
src_install() {
	python_domodule ${PN}
	dobin bcloud-gui
	insinto usr
	doins -r share
}
