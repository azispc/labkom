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