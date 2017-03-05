# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit bash-completion-r1

DESCRIPTION="Erlymon OpenSource GPS Tracking System"
HOMEPAGE="https://www.erlymon.org"
#SRC_URI="https://github.com/erlymon/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/erlymon/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/erlang dev-util/rebar3 dev-db/mongodb"
DEPEND="${RDEPEND}"

src_test() {
	rebar3 xref
}

src_compile() {
	rebar3 as prod release
}

src_install() {
    	insinto /opt/
    	doins -r ${WORKDIR}/${PN}-${PV}/_build/prod/rel/${PN}

	exeinto /opt/${PN}
	doexe ${WORKDIR}/${PN}-${PV}/files/erlymonctl

	doinitd ${WORKDIR}/${PN}-${PV}/files/openrc/${PN}

	fperms 777 /opt/${PN}/bin/{${PN},${PN}-v${PV}}
}

pkg_postinst() {
	elog "elog: Hello world"
	ewarn "ewarn: Hello world"
}
