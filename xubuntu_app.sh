#!/bin/bash
# Xubuntu 16.04 Lab Install
# <https://git.io/v6PAl>

# INSTALL BASE SYSTEM (MANUAL ONE BY ONE) --------------------------------------

## Fresh install
# - Welcome : [Install Xubuntu]
# - Prepare : uncheck all options, [Continue]
# - Install : (*) Erase disk and install Xubuntu, [Install Now], [Continue]
# - Where?  : Jakarta, [Continue]
# - Keyboard: [Continue]
# - Who?    : [Continue]
    # - Name    : Admin Lab
    # - Hostname: lab1-01
    # - Username: adminlab
    # - Password: ****
    # - Confirm : ****
# - [Restart Now]

## Set static IP address
#eth="$(ls /sys/class/net | grep en)"
#host="$(hostname | tr -d a-z-)"
#net="172.18.12"
#cat << EOF | sudo tee -a /etc/network/interfaces
#auto $eth
#iface $eth inet static
#    address $net.$host
#    netmask 255.255.255.0
#    gateway $net.254
#    dns-nameservers 172.17.5.14 172.17.5.21
#EOF
#sudo service networking restart

## Set local repository
#sudo tee /etc/apt/sources.list << EOF
#deb http://172.18.12.13/ubuntu/ xenial main universe multiverse restricted
#deb http://172.18.12.13/ubuntu/ xenial-security main universe multiverse restricted
#deb http://172.18.12.13/ubuntu/ xenial-updates main universe multiverse restricted
#EOF
## Install SSH for remote administration
#sudo apt update
#sudo apt install ssh

start_time=`date +%s`
# APPLICATION ------------------------------------------------------------------
sudo adduser student                                # "Student"; student:student
sudo apt update
sudo apt upgrade

## Download all additional software
wget "http://172.18.12.13/lab/download.lst"
wget -i download.lst

## Basic app
sudo apt -y install virtualbox
sudo apt -y install p7zip unrar
sudo apt -y install libreoffice-impress libreoffice-base tesseract-ocr{,-ara,-ind}
sudo apt -y install dia gimp inkscape graphviz blender
sudo apt -y install mpv audacity vokoscreen
sudo apt -y install filezilla xul-ext-ublock-origin
sudo apt -y install htop tmux tree w3m ntpdate bmon curl
sudo apt -y install xubuntu-restricted-extras
sudo /usr/lib/update-notifier/package-data-downloader
sudo apt -y purge gigolo mousepad parole network-manager gnome-sudoku gnome-mines appstream
## Programming
sudo apt -y install geany geany-plugins
sudo apt -y install build-essential git
sudo apt -y install yasm gdb ddd
sudo apt -y install racket gprolog swi-prolog clips
## IDE
sudo apt -y install codeblocks netbeans
## Machine Learning
sudo apt -y install r-recommended scilab octave weka
## Library
sudo apt -y install freeglut3-dev libglew-dev libglfw3-dev
sudo apt -y install libopencv-dev opencv-doc python-opencv
sudo apt -y install mpi-default-* openmpi-doc
## Web and database
sudo apt -y install postgresql postgis pgadmin3 pgcli sqlite3
sudo apt -y install apache2 php libapache2-mod-php php-pgsql php-sqlite3
## Geospatial
sudo apt -y install qgis libjs-openlayers
## TeX
sudo apt -y install texlive pandoc pandoc-citeproc
## Radig
sudo apt -y install logisim iverilog gtkwave fritzing
## Network
sudo apt -y install nmap traceroute whois wireshark
## Bioinformatics
sudo apt -y install ugene clustal* velvet* soapdenovo* bowtie* samtools plink
## Programming misc
sudo apt -y install golang rustc haskell-platform


###opt---------###
## RStudio --> 1.1.414
sudo dpkg -i rstudio*.deb
sudo apt -y install -f
## GeoServer --> 2.12.1
sudo unzip geoserver*.zip -d /opt
sudo mv /opt/geoserver* /opt/geoserver
echo -e "GEOSERVER_HOME=/opt/geoserver\nexport GEOSERVER_HOME\n" | sudo tee /etc/profile.d/geoserver.sh
sudo addgroup --system geoserver
sudo chown -R :geoserver /opt/geoserver
sudo chmod -R g=u /opt/geoserver

## PyCharmEdu --> 2017.3
sudo tar -xvf pycharm*.gz -C /opt
sudo mv /opt/pycharm* /opt/pycharm
sudo tee /usr/share/applications/jetbrains-pycharm.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Edu
Icon=/opt/pycharm/bin/pycharm.png
Exec="/opt/pycharm/bin/pycharm.sh" %f
Comment=The Drive to Develop
Categories=Development;
Terminal=false
StartupWMClass=jetbrains-pycharm
EOF

## Android Studio --> 3.0.1
sudo unzip android*.zip -d /opt
sudo apt -y install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo tee /usr/share/applications/jetbrains-studio.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Icon=/opt/android-studio/bin/studio.png
Exec="/opt/android-studio/bin/studio.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-studio
EOF

## UnityEditor --> 2017.2.0f3
#### https://forum.unity.com/threads/unity-on-linux-release-notes-and-known-issues.350256/page-2
sudo dpkg -i unity-editor*.deb
sudo apt -y install -f

## GravitDesigner --> 3.2.6
sudo unzip GravitDesigner.zip -d /opt
sudo rm /opt/Installation-Guide.html
sudo tee /usr/share/applications/gravit-designer.desktop << EOF
[Desktop Entry]
Name=Gravit Designer
Comment=Gravit Designer is a full featured free vector design app right at your fingertip.
Exec="/opt/GravitDesigner.AppImage" %U
Terminal=false
Type=Application
Icon=appimagekit-gravit-designer
Categories=Graphics;
TryExec=/opt/GravitDesigner.AppImage
EOF

## Pencil --> 3.0.4
sudo dpkg -i Pencil*.deb

## Postman --> 5.5.0
sudo tar -xvf Postman*.gz -C /opt
sudo tee /usr/share/applications/postman.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Postman
Icon=/opt/Postman/resources/app/assets/icon.png
Exec=/opt/Postman/Postman
Categories=Development;
Terminal=false
EOF

## GoogleChrome
sudo dpkg -i google-chrome*.deb
sudo apt -y install -f

## PyCrypto
tar -xvf pycrypto*.tar.gz
cd pycrypto*
sudo apt -y install python-dev python3-dev
python setup.py build
python3 setup.py build
sudo python setup.py install
sudo python3 setup.py install
cd ..
rm -r pycrypto

## Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mono-official.list
sudo apt update
sudo apt -y install mono-complete mono-xsp4

## MonoDevelop
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt -y install flatpak
sudo flatpak install --from "https://download.mono-project.com/repo/monodevelop.flatpakref"

## SublimeText
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -y install sublime-text

# SETTINGS ---------------------------------------------------------------------
## Autostart -> off
echo "Hidden=true" | sudo tee -a /etc/xdg/autostart/update-notifier.desktop
echo "Hidden=true" | sudo tee -a /etc/xdg/autostart/blueman.desktop
echo "Hidden=true" | sudo tee -a /etc/xdg/autostart/nm-applet.desktop
## Wallpaper
cd /usr/share/xfce4/backdrops
sudo wget "http://172.18.12.13/lab/ipb.jpg"
sudo rm xubuntu-wallpaper.png
sudo ln -s ipb.jpg xubuntu-wallpaper.png
cd
## Geany: colorscheme
unzip geany-themes-master.zip
sudo cp geany-themes-master/colorschemes/* /usr/share/geany/colorschemes/
rm -r geany-themes-master
## Geany: x86 asm, Verilog, Python setting
sudo cp filetypes.* /usr/share/geany/
sudo sed -i 's/CM=python /CM=python3 /' /usr/share/geany/filetypes.python
# Disassociate qgis-mime from jpeg and tiff
sudo sed -i 's|image/tiff;image/jpeg;image/jp2;||' /usr/share/applications/qgis.desktop
sudo sed -i '66,117 d' /usr/share/mime/packages/qgis.xml
sudo update-mime-database /usr/share/mime
# Remove bmon, monodoc, unity-monodevelop from menu
sudo rm /usr/share/applications/{bmon,monodoc,unity-monodevelop}.desktop
# Fix Fritzing missing icon
sudo sed -i 's/\(Icon=fritzing\)/\1_icon.png/' /usr/share/applications/fritzing.desktop
## Apache module: userdir, rewrite
sudo sed -i '21,25 s/^/#/' /etc/apache2/mods-available/php7.0.conf
sudo a2enmod userdir rewrite
sudo service apache2 restart
## Kill WiFi and BT
sudo sed -ri '$ s/(^exit 0$)/rfkill block all\n\1/' /etc/rc.local
## Performance [if RAM < 2GB]
if [ $(free | grep Mem | cut -c 13-19) -lt 2000000 ]; then
    echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
    sudo sed -i 's/compositing" type="bool" value="true"/compositing" type="bool" value="false"/' /etc/xdg/xdg-xubuntu/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
fi


# USER STUDENT -----------------------------------------------------------------
## Add user student to groups
sudo adduser student med
sudo adduser student geoserver
sudo adduser student wireshark
su student -c /opt/geoserver/bin/startup.sh
## Store student default home directory
sudo 7zr a /opt/student.7z /home/student


# SECURITY ---------------------------------------------------------------------
## Add timestamp to bash_history
echo 'HISTTIMEFORMAT="%d/%m/%y %T "' | sudo tee -a /etc/bash.bashrc
## Disable student password change
sudo passwd student -n 2000
## Disable student SSH
echo 'DenyUsers student' | sudo tee -a /etc/ssh/sshd_config

end_time=`date +%s`
echo execution time was `expr $end_time - $start_time` s.
