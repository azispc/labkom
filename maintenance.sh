# MAINTENANCE ------------------------------------------------------------------
sudo apt clean
sudo rm -r /var/lib/apt/lists/*
sudo apt update
sudo apt upgrade
sudo apt autoremove --purge
## Clean and restore student's home
su - student
rm -rf * .*
7zr x /opt/student.7z
mv -f student/.* .
rm -r student
vboxmanage setproperty machinefolder ~/.vm
vboxmanage modifyhd /opt/vm/win7_lab.vdi --type immutable
vboxmanage createvm --name "win7_lab" --ostype "Windows7" --register
vboxmanage modifyvm "win7_lab" --memory 1536 --vram 32 --clipboard bidirectional
vboxmanage storagectl "win7_lab" --name "SATA Controller" --add sata
vboxmanage storageattach "win7_lab" --storagectl "SATA Controller" --device 0 --port 0 --type hdd --mtype immutable --medium /opt/vm/win7_lab.vdi
vboxmanage sharedfolder add "win7_lab" --name "Public" --hostpath ~/Public/ --automount
vboxmanage setextradata global "GUI/SuppressMessages" "all"
vboxmanage setextradata "win7_lab" "GUI/Fullscreen" "on"
logout

## Recreate student's database
sudo su - postgres
psql << EOF
DROP DATABASE IF EXISTS student;
DROP USER IF EXISTS student;
CREATE USER student WITH PASSWORD 'student';
CREATE DATABASE student;
GRANT ALL PRIVILEGES ON DATABASE student TO student;
\c student;
CREATE EXTENSION adminpack;
CREATE EXTENSION postgis;
EOF
logout
