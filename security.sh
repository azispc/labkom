# SECURITY ---------------------------------------------------------------------
## Add timestamp to bash_history
echo 'HISTTIMEFORMAT="%d/%m/%y %T "' | sudo tee -a /etc/bash.bashrc
## Disable student password change
sudo passwd student -n 2000
## Disable student SSH
echo 'DenyUsers student' | sudo tee -a /etc/ssh/sshd_config
