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
