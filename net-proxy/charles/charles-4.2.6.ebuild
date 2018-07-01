# https://www.charlesproxy.com/assets/release/4.2/charles-proxy-4.2_amd64.tar.gz
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Charles is an HTTP proxy / HTTP monitor / Reverse Proxy"
HOMEPAGE="http://www.charlesproxy.com/"
SRC_URI="http://www.charlesproxy.com/assets/release/${PV}/charles-proxy-${PV}_amd64.tar.gz
	x86?   ( http://www.charlesproxy.com/assets/release/${PV}/charles-proxy-${PV}.tar.gz )"
LICENSE="Proprietary"
SLOT="0"
IUSE=""
S="${WORKDIR}/charles"

src_install()
{
	dodir /opt/${P}
	cp -r ${S}/lib ${S}/doc ${S}/icon ${D}/opt/${P}/
	exeinto /opt/${P}/bin
	doexe bin/charles
	dosym /opt/${P}/bin/charles /opt/bin/charles
}
