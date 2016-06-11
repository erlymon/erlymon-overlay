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
	rebar3 tar
}

src_install() {
	mkdir -p ${WORKDIR}/${PN}-${PV}/_build/${PN}
	tar xvzpf ${WORKDIR}/${PN}-${PV}/_build/default/rel/${PN}/${PN}-${PV}.tar.gz --xattrs -C ${WORKDIR}/${PN}-${PV}/_build/${PN}
	cp ${WORKDIR}/${PN}-${PV}/_build/${PN}/releases/${PV}/vm.args.orig ${WORKDIR}/${PN}-${PV}/_build/${PN}/releases/${PV}/vm.args
	cp ${WORKDIR}/${PN}-${PV}/_build/${PN}/releases/${PV}/sys.config.orig ${WORKDIR}/${PN}-${PV}/_build/${PN}/releases/${PV}/sys.config

    	insinto /opt/
    	doins -r ${WORKDIR}/${PN}-${PV}/_build/${PN}/

	exeinto /opt/${PN}
	doexe ${WORKDIR}/${PN}-${PV}/files/erlymonctl

	doinitd ${WORKDIR}/${PN}-${PV}/files/openrc/${PN}

	fperms 777 /opt/${PN}/bin/{${PN},${PN}-${PV}}
}

pkg_postinst() {
	elog "elog: Hello world"
	ewarn "ewarn: Hello world"
}
