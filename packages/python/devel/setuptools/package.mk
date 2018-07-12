################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="setuptools"
PKG_VERSION="20.6.7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://pypi.python.org/pypi/setuptools"
PKG_URL="http://pypi.python.org/packages/source/s/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python:host"
PKG_SECTION="python/devel"
PKG_SHORTDESC="setuptools: A collection of enhancements to the Python distutils"
PKG_LONGDESC="Distribute is intended to replace Setuptools as the standard method for working with Python module distributions. Packages built and distributed using distribute look to the user like ordinary Python packages based on the distutils. Your users don't need to install or even know about setuptools in order to use them, and you don't have to include the entire setuptools package in your distributions. By including just a single bootstrap module (a 7K .py file), your package will automatically download and install setuptools if the user is building your package from source and doesn't have a suitable version already installed."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_host() {
  : # nothing todo
}

makeinstall_host() {
  python setup.py install --prefix=$ROOT/$TOOLCHAIN
}

make_target() {
  : # nothing todo
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/$PKG_NAME-*.egg-info
}
