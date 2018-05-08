# WINDOWS VM -------------------------------------------------------------------
## Download and extract VDI (076ff3bc23466fce97f0853bed6e2c17)
wget "http://172.18.12.13/lab/win7_lab_201609.vdi.rar"
unrar e win7_lab_201609.vdi.rar
sudo mv win7_lab.vdi /opt/vm
sudo chown root:vboxusers /opt/vm/win7_lab.vdi
sudo chmod 755 /opt/vm/win7_lab.vdi
sudo adduser student vboxusers

## Create VM Win7 (run as student)
su - student
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
