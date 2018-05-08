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
