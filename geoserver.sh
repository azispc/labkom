## GeoServer --> 2.12.1
sudo unzip geoserver*.zip -d /opt
sudo mv /opt/geoserver* /opt/geoserver
echo -e "GEOSERVER_HOME=/opt/geoserver\nexport GEOSERVER_HOME\n" | sudo tee /etc/profile.d/geoserver.sh
sudo addgroup --system geoserver
sudo chown -R :geoserver /opt/geoserver
sudo chmod -R g=u /opt/geoserver