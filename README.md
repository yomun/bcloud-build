# bcloud-build
bcloud 生成安装包<br><br>
bcloud 源码来自<br>
https://github.com/Yufeikang/bcloud<br><br>
$ git clone https://github.com/yomun/bcloud-build<br>
* 以下制作 RPM 安装包,<br> 
需要在 Ubuntu 安装 $ sudo apt install rpm<br>
需要在 Fedora 安装 $ sudo dnf install rpm-build rpmrebuild rpmlint fakeroot<br>
需要在 OpenSUSE 安装 $ sudo zypper install rpm-build rpmrebuild rpmlint fakeroot<br>
需要在 Mageia 安装 (先进入 root) $ urpmi rpm-build rpmrebuild rpmlint fakeroot
#### Ubuntu / Debian / Linux Mint / Zorin OS
$ cd bcloud-build/DEB<br>
$ mkdir build<br>
$ dpkg-deb -b bcloud build/<br><br>
$ sudo apt install python3-dev python3-setuptools<br>
$ sudo easy_install3 pip<br><br>
$ sudo pip3 install --upgrade keyring<br>
$ sudo pip3 install --upgrade pycrypto<br>
$ sudo pip3 install cssselect<br>
$ sudo pip3 install pyinotify<br>
$ sudo dpkg -i bcloud_3.9.1-0_all.deb<br>
$ bcloud-gui<br><br>
$ apt list bcloud<br>
$ sudo apt remove bcloud
#### Fedora 26 (Python 3.6)
$ cd bcloud-build/RPM<br><br>
$ sudo dnf install gnome-icon-theme-symbolic libappindicator-gtk3 libnotify python3-devel<br>
$ sudo dnf install python3-cssselect python3-gobject python3-keyring python3-lxml python3-urllib3<br>
$ sudo dnf install python3-inotify python3-dbus python3-crypto<br><br>
$ bash build.sh<br>
$ sudo rpm -i bcloud-3.9.1-0.noarch.rpm<br>
$ bcloud-gui<br><br>
$ rpm -qa | grep bcloud<br>
$ sudo rpm -e bcloud
#### OpenSUSE (Python 3.6)
$ cd bcloud-build/RPM<br><br>
$ sudo zypper install gnome-icon-theme-symbolic typelib-1_0-AppIndicator3-0_1 libnotify python3-devel<br>
$ sudo zypper install python3-cssselect python3-gobject python3-keyring python3-lxml python3-urllib3<br>
$ sudo zypper install python3-pyinotify<br>
$ sudo pip3 install pydbus<br>
$ sudo pip3 install pycrypto<br><br>
$ bash build.sh<br>
$ sudo rpm -i bcloud-3.9.1-0.noarch.rpm<br>
$ bcloud-gui<br><br>
$ rpm -qa | grep bcloud<br>
$ sudo rpm -e bcloud
#### Mageia 6 (Python 3.5)
$ cd bcloud-build/RPM/Mageia<br><br>
$ su root<br>
$ urpmi gnome-icon-theme-symbolic lib64appindicator3-gir0.1 libnotify python3-devel python3-setuptools<br>
$ urpmi python3-cssselect python3-gobject3 python3-keyring python3-lxml python3-urllib3<br>
$ urpmi python3-pyinotify python3-dbus<br>
$ pip3 install --upgrade pip<br>
$ pip3 install pycrypto<br><br>
$ su USER_ID<br>
$ bash build.sh<br>
$ su root<br>
$ urpmi bcloud-3.9.1-0-noarch.mga6.rpm<br>
$ bcloud-gui<br><br>
$ rpm -qa | grep bcloud<br>
$ rpm -e bcloud
#### Antergos / ArchLinux / Manjaro (Python 3.6)
$ sudo pacman-mirrors -g  # Antergos 不需要这行<br>
$ sudo pacman -Syy<br>
$ sudo pacman -Syu<br>
$ sudo pacman -S binutils make gcc pkg-config fakeroot<br><br>
$ cd bcloud-build/TAR.XZ<br>
$ tar -czf bcloud-3.9.1.tar.gz bcloud-3.9.1/<br><br>
$ makepkg -g  # 可以知道 md5sums 的值, 取代 PKGBUILD 里的 md5sums<br>
$ sudo pacman -S gnome-icon-theme-symbolic libappindicator-gtk3 libnotify<br>
$ sudo pacman -S python-cssselect python-gobject python-keyring python-lxml python-urllib3<br>
$ sudo pacman -S python-pyinotify python-dbus python-crypto<br>
$ makepkg<br><br>
$ su<br>
$ pacman -U bcloud-3.9.1-0-any.pkg.tar.xz<br>
$ bcloud-gui<br><br>
$ pacman -Qs bcloud<br>
$ pacman -R bcloud
#### Sabayon / Gentoo (Python 3.5)
$ su<br>
$ mkdir -p /usr/local/portage<br>
$ nano /etc/portage/make.conf<br>
PORTDIR_OVERLAY="/usr/local/portage"<br><br>
$ mkdir -p /usr/local/portage/metadata<br>
$ mkdir -p /usr/local/portage/profiles<br>
$ echo "masters = gentoo" > /usr/local/portage/metadata/layout.conf<br>
$ echo "user_defined" > /usr/local/portage/profiles/repo_name<br><br>
Rigo Application Browser 安装 gcc, pygobject<br>
$ emerge --sync<br>
$ emerge --oneshot portage<br><br>
$ cd TBZ2<br>
$ cp bcloud-3.9.1.tar.gz /usr/local/portage/app-misc/bcloud<br>
$ cp /usr/local/portage/app-misc/bcloud/bcloud-3.9.1.tar.gz /usr/portage/distfiles<br>
$ mkdir -p /usr/local/portage/app-misc/bcloud<br>
$ cp bcloud-3.9.1.ebuild /usr/local/portage/app-misc/bcloud<br><br>
$ cd /usr/local/portage/app-misc/bcloud<br>
$ chmod 755 *<br>
$ ebuild ./bcloud-3.9.1.ebuild manifest<br>
$ emerge x11-themes/gnome-icon-theme-symbolic dev-libs/libappindicator x11-libs/libnotify<br>
$ emerge dev-python/cssselect dev-python/pygobject dev-python/keyring dev-python/lxml dev-python/urllib3<br>
$ emerge dev-python/pyinotify dev-python/dbus-python dev-python/pycrypto<br>
[ 生成 tbz2 ]<br>
$ emerge -av -B bcloud<br>
$ cp /usr/portage/packages/app-misc/bcloud-3.9.1.tbz2 /usr/local/portage/app-misc/bcloud<br>
$ emerge bcloud-3.9.1.tbz2 -K (或 -k)<br>
[ 不生成 tbz2, 直接安装 ]<br>
$ emerge -avt bcloud<br>
$ bcloud-gui<br><br>
$ qlist -I | grep bcloud<br>
$ emerge -C bcloud
