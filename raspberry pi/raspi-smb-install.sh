#source: https://www.jeffgeerling.com/blog/2021/htgwa-create-samba-smb-share-on-raspberry-pi

sudo apt install -y samba samba-common-bin

sudo mkdir /mnt/shared
sudo mount /dev/sda1 /mnt/shared/
sudo chmod -R 777 /mnt/shared

echo 'ADD FOLLOWING LINES TO /etc/samba/smb.conf'
echo '[vault]
path=/mnt/shared/
writeable=Yes
browsable=yes
guest ok=yes'

echo 'Zie smb.conf'