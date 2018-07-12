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