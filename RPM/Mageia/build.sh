#!/usr/bin/env bash
#
# Author: Jason Mun <yomun@yahoo.com>
# https://github.com/yomun/bcloud-build
#
# sudo apt install rpm
# bash build.sh
# sudo rpm -i bcloud-3.9.1-0.x86_64.rpm

set -e
set -x

# Prepare 'bcloud.temp.spec'
PATH_DATA="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PYTHON_VERSION=`python3 -V | sed "s/Python //g" | sed "s/\.*.$//g"`

DEB="bcloud_3.9.1-0_all.deb"
DEB_URL="https://github.com/yomun/bcloud-build/raw/master/${DEB}"
SPEC="bcloud.spec"
NAME="bcloud"
VERSION="3.9.1"
RELEASE="0"
ARCH="x86_64"
SEMIDIR="${NAME}-${VERSION}"
FULLDIR="${SEMIDIR}-${RELEASE}.noarch"
PYTHON_SITEPACK="/usr/lib64/python${PYTHON_VERSION}/site-packages/"

# Prepare a space to ready the Source
rm -rf "tmp-${ARCH}"
mkdir -p "tmp-${ARCH}"
cd tmp-${ARCH}

# Prepare SPEC
cp -rv "${PATH_DATA}/bcloud.temp.spec" "${SPEC}"
sed -i "s/\%{name}/${NAME}/g" "${SPEC}"
sed -i "s/\%{version}/${VERSION}/g" "${SPEC}"

# Download DEB
rm -rf "${DEB}"
wget "${DEB_URL}"

# Extract DEB
ar xf "${DEB}"
tar xvf "data.tar.xz" .

mkdir -p "{$SEMIDIR}"
mkdir -p "${SEMIDIR}/usr/bin"
# sudo mv usr "${SEMIDIR}/"
cp -r usr "${SEMIDIR}/"

mkdir -p "${SEMIDIR}${PYTHON_SITEPACK}"
cp -r "${SEMIDIR}/usr/lib/python3/dist-packages/bcloud" "${SEMIDIR}${PYTHON_SITEPACK}"
rm -rf "${SEMIDIR}/usr/lib/python3/dist-packages/bcloud"

# Prepare the Source Done..
tar zcvf "${SEMIDIR}.tar.gz" "${SEMIDIR}"

mkdir -p "${HOME}/rpmbuild/SOURCES"
mkdir -p "${HOME}/rpmbuild/SPECS"

cp "${SEMIDIR}.tar.gz" "${HOME}/rpmbuild/SOURCES/"
cp "${SPEC}" "${HOME}/rpmbuild/SPECS/"

# Build RPM
fakeroot rpmbuild -ba "${SPEC}" --target "${ARCH}"

cp "${HOME}/rpmbuild/RPMS/noarch/*.rpm" "${HOME}"

# Clear
rm -rf "tmp-${ARCH}"

rm -rf "${HOME}/rpmbuild/BUILD/${SEMIDIR}"
rm -rf "${HOME}/rpmbuild/RPMS/noarch"
rm -rf "${HOME}/rpmbuild/SOURCES/${SEMIDIR}.tar.gz"
rm -rf "${HOME}/rpmbuild/SPECS/${SPEC}"
rm -rf "${HOME}/rpmbuild/SRPMS/${SEMIDIR}-${RELEASE}.src.rpm"
