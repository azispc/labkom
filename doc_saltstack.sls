#!/bin/bash
# Xubuntu 16.04 Lab Install
# INSTALL BASE SYSTEM (MANUAL ONE BY ONE) --------------------------------------
## Fresh install
# - Welcome : [Install Xubuntu]
# - Prepare : uncheck all options, [Continue]
# - Install : (*) Erase disk and install Xubuntu, [Install Now], [Continue]
# - Where?  : Jakarta, [Continue]
# - Keyboard: [Continue]
# - Who?    : [Continue]
    # - Name    : Admin Lab
    # - Hostname: lab1-71
    # - Username: adminlab
    # - Password: ***
    # - Confirm : ***
# - [Restart Now]
#sudo lshw

## Set static IP address
eth="$(ls /sys/class/net | grep en)"
host="$(hostname | tr -d a-z-)"
net="172.18.12"
cat << EOF | sudo tee -a /etc/network/interfaces
auto $eth
iface $eth inet static
    address $net.$host
    netmask 255.255.255.0
    gateway $net.254
    dns-nameservers 172.17.5.14 172.17.5.21
EOF
sudo service networking restart
sudo apt install ssh

#SaltStack 2018.3 (Latest, April 2,2018), Ubuntu 16 (xenial) PY2
#Run the following command to import the SaltStack repository key:
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
#set repositori saltstack /etc/apt/sources.list
sudo tee /etc/apt/sources.list << EOF
deb http://172.18.12.13/ubuntu/ xenial main universe multiverse restricted
deb http://172.18.12.13/ubuntu/ xenial-security main universe multiverse restricted
deb http://172.18.12.13/ubuntu/ xenial-updates main universe multiverse restricted
deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main
EOF
sudo apt update

#access root
sudo su 

#instal sof. SaltStack
sudo apt-get install salt-master
sudo apt-get install salt-minion
sudo apt-get install salt-ssh

#uncoment "#interface: 0.0.0.0 >> interface:(local ip comp) > /etc/salt/master
#uncoment "#publish_port: 5045 >> /etc/salt/master
sudo systemctl restart salt-master
sudo systemctl restart salt-minion

#list salt-minion
salt-key -L
salt-key -help

#accept all salt-minion
salt-key -a
salt-key -A

#function test.ping all salt-minion
salt '*' test.ping
salt '*' cmd.run "sudo apt update"

#poweroff & reboot minion
salt '*' system.reboot
salt '*' system.poweroff

##script_saltstack
saltstack_user:
  user.present:
    - name: student
    - password: $6$Kh9rNhbM$GjHMGtoH7rCt/UCHqnsC0gBlBKJvEd0d7sW7yGiTJXSBzJHWGdbWRXRfmBg0OMj4FRUKe1jOOTFo1b4GaX6Xu.

saltstack_pkg:
  pkg:
     - installed
     - pkgs:
          - virtualbox
          - p7zip
          - unrar 
          - libreoffice-impress
          - libreoffice-base
          - tesseract-ocr-ara
          - tesseract-ocr-ind
          - dia
          - gimp
          - inkscape
          - graphviz
          - blander
          - mpv
          - audacity
          - vokoscreen
          - filezilla
          - xul-ext-ublock-origin
          - htop
          - tmux
          - tree
          - w3m
          - ntpdate
          - curl
          - xubuntu-restricted-extras
          - geany
          - geany-plugins
          - build-essential
          - git
          - yasm
          - gdb
          - ddd
          - racket
          - gprolog
          - swi-prolog
          - clips
          - codeblocks
          - netbeans
          - r-recommended
          - scilab
          - octave
          - weka
          - freeglut3-dev
          - libglew-dev
          - libglfw3-dev
          - libopencv-dev
          - opencv-doc
          - python-opencv
          - mpi-default-dev
          - openmpi-doc
          - postgresql
          - postgis
          - pgadmin3
          - pgcli
          - sqlite3
          - apache2
          - php
          - libapache2-mod-php
          - php-pgsql
          - php-sqlite3
          - qgis
          - libjs-openlayers
          - texlive
          - pandoc
          - pandoc-citeproc
          - logisim
          - iverilog
          - gtkwave
          - fritzing
          - nmap
          - traceroute
          - whois
          - wireshark
          - ugane
          - clustal
          - velvet
          - soapdenovo
          - bowtie
          - samtools
          - plink
          - golang
          - rustc
          - haskell-platform

saltstack_run:
 cmd.run:
     - name: wget
        http://172.18.12.13/lab/jdk-8u161-linux-x64.tar.gz
        http://172.18.12.13/lab/PacketTracer711_64bit_linux.tar.gz
        http://172.18.12.13/lab/rstudio-xenial-1.1.414-amd64.deb
        http://172.18.12.13/lab/geoserver-2.12.1-bin.zip
        http://172.18.12.13/lab/pycharm-edu-2017.3.tar.gz
        http://172.18.12.13/lab/MEGAN_Community_unix_6_10_6.sh
        http://172.18.12.13/lab/MetaSim_unix_0_9_5.sh
        http://172.18.12.13/lab/TASSEL_5_unix.sh
        http://172.18.12.13/lab/unity-editor_amd64-2017.2.0f3.deb
        http://172.18.12.13/lab/GravitDesigner.zip
        http://172.18.12.13/lab/Pencil_3.0.4_amd64.deb
        http://172.18.12.13/lab/Postman-linux-x64-5.5.0.tar.gz
        http://172.18.12.13/lab/google-chrome-stable_current_amd64.deb
        http://172.18.12.13/lab/pycrypto-2.6.1.tar.gz
        http://172.18.12.13/lab/ubuntu-server.vdi.gz
        http://172.18.12.13/lab/ipb.jpg
        http://172.18.12.13/lab/geany-themes-master.zip
        http://172.18.12.13/lab/filetypes.asm
        http://172.18.12.13/lab/filetypes.verilog
        http://172.18.12.13/lab/filetypes.markdown

saltstack_script0:
 cmd.script:
     - source: /srv/salt/opt.sh

saltstack_script1:
 cmd.script:
     - source: /srv/salt/setting.sh

saltstack_script2:
 cmd.script:
     - source: /srv/salt/student.sh

saltstack_script3:
 cmd.script:
     - source: /srv/salt/security.sh
