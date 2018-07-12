## PyCrypto
tar -xvf pycrypto*.tar.gz
cd pycrypto*
sudo apt -y install python-dev python3-dev
python setup.py build
python3 setup.py build
sudo python setup.py install
sudo python3 setup.py install
cd ..
rm -r pycrypto