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
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -y install sublime-text
