# USER STUDENT -----------------------------------------------------------------
## Add user student to groups
sudo adduser student med
sudo adduser student geoserver
sudo adduser student wireshark
su student -c /opt/geoserver/bin/startup.sh
## Store student default home directory
sudo 7zr a /opt/student.7z /home/student
