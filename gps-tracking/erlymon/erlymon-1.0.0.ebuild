# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit bash-completion-r1

DESCRIPTION="Erlymon OpenSource GPS Tracking System"
HOMEPAGE="https://github.com/pese-git/erlymon"
SRC_URI="https://github.com/pese-git/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/erlang dev-util/rebar3"
DEPEND="${RDEPEND}"

src_test() {
	rebar3 xref
}

src_compile() {
	rebar3 release
}

src_install() {
    	insinto /opt/
    	doins -r ${WORKDIR}/${PN}-${PV}/_build/default/rel/${PN}/

	insinto /opt/${PN}/releases/${PV}/
	doins -r ${WORKDIR}/${PN}-${PV}/config/{vm.args,sys.config}

	exeinto /opt/${PN}
	doexe ${WORKDIR}/${PN}-${PV}/files/erlymonctl

	doinitd ${WORKDIR}/${PN}-${PV}/files/openrc/${PN}
}

pkg_postinst() {
	elog "elog: Hello world"
	ewarn "ewarn: Hello world"
}
