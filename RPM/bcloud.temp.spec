%global debug_package %{nil}
%global __os_install_post /usr/lib/rpm/brp-compress %{nil}

Name:		bcloud
Version:	3.9.1
Release:	0%{?dist}
Summary:	Baidu Pan client for Linux Desktop users

License:	GPLv3
URL:		https://github.com/yomun/bcloud-build

Source:		%{name}-%{version}.tar.gz

BuildArch:	noarch
# BuildRequires:	python3-devel
# Requires:	python3-crypto
# Requires:	python3-dbus
Requires:	python3-cssselect
Requires:	python3-gobject
Requires:	python3-keyring
Requires:	python3-lxml
Requires:	python3-urllib3
Requires:	gnome-icon-theme-symbolic
Requires:	libnotify

%description
Baidu Pan client for Linux Desktop users.

%prep
%setup -q

%build
echo $RPM_BUILD

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT
mv ./* $RPM_BUILD_ROOT/

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.lang
%defattr(-,root,root)
/usr/lib/python3.6/site-packages/bcloud/*
/usr/bin/bcloud-gui
/usr/share/locale/zh_TW/LC_MESSAGES/bcloud.mo
/usr/share/locale/zh_CN/LC_MESSAGES/bcloud.mo
/usr/share/bcloud/color_schema.json
/usr/share/bcloud/icons/hicolor/scalable/actions/cloud-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/folder-upload-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/others-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/cloud-download-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/mail-send-receive-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/bittorrent-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/actions/document-new-symbolic.svg
/usr/share/bcloud/icons/hicolor/scalable/apps/bcloud.svg
/usr/share/bcloud/icons/unknown.png
/usr/share/icons/hicolor/64x64/apps/bcloud.png
/usr/share/icons/hicolor/22x22/apps/bcloud.png
/usr/share/icons/hicolor/16x16/apps/bcloud.png
/usr/share/icons/hicolor/scalable/apps/bcloud.svg
/usr/share/icons/hicolor/512x512/apps/bcloud.png
/usr/share/icons/hicolor/24x24/apps/bcloud.png
/usr/share/icons/hicolor/256x256/apps/bcloud.png
/usr/share/icons/hicolor/128x128/apps/bcloud.png
/usr/share/icons/hicolor/32x32/apps/bcloud.png
/usr/share/icons/hicolor/48x48/apps/bcloud.png
/usr/share/applications/bcloud.desktop
# %{_datadir}/icons/*
# %{_datadir}/%{name}/*
# %{_bindir}/%{name}-gui
# %{_datadir}/applications/%{name}.desktop
# generated by python3
# %exclude %{python3_sitelib}/bcloud/__pycache__

%post
gtk-update-icon-cache /usr/share/icons/hicolor
#cd %{python3_sitelib}
#for file in bcloud*
#do
#    if [[ -f $file && $file != "bcloud-%{version}-py%{python3_version}.egg-info" ]]
#    then
#	rm $file
#    fi
#done
