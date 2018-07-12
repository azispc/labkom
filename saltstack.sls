saltstack_user:
  user.present:
    - name: student
    - password: $6$Kh9rNhbM$GjHMGtoH7rCt/UCHqnsC0gBlBKJvEd0d7sW7yGiTJXSBzJHWGdbWRXRfmBg0OMj4FRUKe1jOOTFo1b4GaX6Xu.

saltstack_basicapp:
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

saltstack_programming:
  pkg:
      - installed
      - pkgs:
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

saltstack_ide:
  pkg:
      - installed
      - pkgs:
          - codeblocks
          - netbeans

saltstack_meachinelearning:
  pkg:
      - installed
      - pkgs:
          - r-recommended
          - scilab
          - octave
          - weka

saltstack_library:
  pkg:
      - installed
      - pkgs:
          - freeglut3-dev
          - libglew-dev
          - libglfw3-dev
          - libopencv-dev
          - opencv-doc
          - python-opencv
          - mpi-default-dev
          - mpi-default-bin
          - openmpi-doc

saltstack_webdb:
  pkg:
      - installed
      - pkgs:
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

saltstack_geospatial:
  pkg:
      - installed
      - pkgs:
          - qgis
          - libjs-openlayers

saltstack_tex:
  pkg:
      - installed
      - pkgs:
          - texlive
          - pandoc
          - pandoc-citeproc

saltstack_radig:
  pkg:
      - installed
      - pkgs:
          - logisim
          - iverilog
          - gtkwave
          - fritzing

saltstack_network:
  pkg:
      - installed
      - pkgs:
          - nmap
          - traceroute
          - whois
          - wireshark

saltstack_bioinformatic:
  pkg:
      - installed
      - pkgs:
          - ugene
          - clustalw
          - clustalx
          - velvet-example
          - velvet-long
          - velvetoptimiser
          - velvet-tests
          - soapdenovo
          - soapdenovo2
          - bowtie
          - bowtie2
          - bowtie-examples
          - bowtie2-examples
          - samtools
          - plink

saltstack_programmingmisc:
  pkg:
      - installed
      - pkgs:
          - golang
          - rustc
          - haskell-platform

saltstack_remove:
  pkg:
     - purged
     - pkgs:
          - gigolo
          - mousepad
          - parole
          - network-manager
          - gnome-sudoku
          - gnome-mines
          - appstream
          
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

saltstack_rstudio:
 cmd.script:
     - source: /srv/salt/rstudio.sh

saltstack_geoserver:
 cmd.script:
     - source: /srv/salt/geoserver.sh

saltstack_pycharm:
 cmd.script:
     - source: /srv/salt/pycharm.sh

saltstack_androidstudio:
 cmd.script:
     - source: /srv/salt/androidstudio.sh

saltstack_unity:
 cmd.script:
     - source: /srv/salt/unity.sh

saltstack_gravitydesigner:
 cmd.script:
     - source: /srv/salt/gravitdesigner.sh

saltstack_pencil:
 cmd.script:
     - source: /srv/salt/pencil.sh

saltstack_postman:
 cmd.script:
     - source: /srv/salt/postman.sh

saltstack_googlechrome:
 cmd.script:
     - source: /srv/salt/googlechrome.sh

saltstack_pycrypto:
 cmd.script:
     - source: /srv/salt/pycrypto.sh

saltstack_mono:
 cmd.script:
     - source: /srv/salt/mono.sh

saltstack_monodevelop:
 cmd.script:
     - source: /srv/salt/monodevelop.sh

saltstack_sublimetext:
 cmd.script:
     - source: /srv/salt/sublimetext.sh

saltstack_setting:
 cmd.script:
     - source: /srv/salt/setting.sh

saltstack_student:
 cmd.script:
     - source: /srv/salt/student.sh

saltstack_security:
 cmd.script:
     - source: /srv/salt/security.sh