# Teamspeak 3 server installer: 
# Uses box86 emulator to run the x86 linux version of TS on the arm cpu of raspberry pi
# Guides used: 
# https://pimylifeup.com/raspberry-pi-x86/
# https://pimylifeup.com/raspberry-pi-teamspeak/

# ----- VARIABLES -----


# ----- COMMANDS -----

# -- Installation box86

sudo apt update
sudo apt full-upgrade

sudo apt install git build-essential cmake
git clone --branch "v0.2.6" https://github.com/ptitSeb/box86
git clone https://github.com/ptitSeb/box86

# Extra steps for 64-bit OS (uncomment if needed)
# sudo dpkg --add-architecture armhf
# sudo apt update
# sudo apt install gcc-arm-linux-gnueabihf libc6:armhf libncurses5:armhf libstdc++6:armhf

# Compiling x86 emulator

cd ~/box86
mkdir build
cd build

# CMake command for RPI 4 (32bit)
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
# CMake command for RPI 4 (64bit)
# cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
# CMake command for RPI 3 
# cmake .. -DRPI3=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
# CMake command for RPI 2
# cmake .. -DRPI2=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo

make -j$(nproc)
sudo make install
sudo reboot
sudo systemctl restart systemd-binfmt

# -- Installation TS server

sudo apt install jq

wget $(curl -Ls 'https://www.teamspeak.com/versions/server.json' | jq -r '.linux.x86.mirrors | values[]')
tar xvf teamspeak3-server_linux_x86-*
rm teamspeak3-server_linux_x86-*

cd teamspeak3-server_linux_x86
touch .ts3server_license_accepted

./ts3server start

# -- Add TS service to systemctl

sudo touch /etc/systemd/system/teamspeak3.service

cat <<EOF >> /etc/systemd/system/teamspeak3.service
[Unit]
Description=TeamSpeak 3 Server
After=network.target

[Service]
User=vault
WorkingDirectory=/home/vault/teamspeak3-server_linux_x86/
ExecStart=/home/vault/teamspeak3-server_linux_x86/ts3server
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable teamspeak3
sudo systemctl start teamspeak3
sudo systemctl status teamspeak3

echo "TS server installation complete.."