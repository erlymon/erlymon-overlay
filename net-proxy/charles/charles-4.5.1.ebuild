# https://www.charlesproxy.com/assets/release/4.2/charles-proxy-4.2_amd64.tar.gz
KEYWORDS="~amd64"


# https://www.charlesproxy.com/assets/release/4.5.1/charles-proxy-4.5.1.tar.gz
# https://www.charlesproxy.com/assets/release/4.5.1/charles-proxy-4.5.1_amd64.tar.gz
DESCRIPTION="Charles is an HTTP proxy / HTTP monitor / Reverse Proxy"
HOMEPAGE="http://www.charlesproxy.com/"
SRC_URI="http://www.charlesproxy.com/assets/release/${PV}/charles-proxy-${PV}_amd64.tar.gz"

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
