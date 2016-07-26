#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo mkdir /etc/apt
sudo mkdir /etc/apt/sources.list.d
sudo touch /etc/apt/sources.list.d/docker.list
sudo cat > /etc/apt/sources.list.d/docker.list << EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF
sudo apt-get update
sudo apt-get purge lxc-dockery
sudo apt-cache policy docker-engine
sudo apt-get upgrade -y
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get update
sudo apt-get install docker-engine -y
sudo usermod -aG docker root
sudo usermod -aG docker asd
touch /etc/init.d/myscript.sh
sudo cat > /etc/init.d/myscript.sh << EOF
sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.1 http://192.168.1.3:8080/v1/scripts/8FD1B57205383841D6C6:1465902000000:K7K3C5C5hUHt4yeP3PIO79ELsc
sudo mkdir /mos
sudo wget -P /mos/ --no-check-certificate https://raw.githubusercontent.com/Supermies/Testata/master/ping.sh
sudo chmod +x /mos/ping.sh
sudo rm /etc/init.f/myscript.sh
EOF
sudo chmod +x /etc/init.d/myscript.sh
sudo update-rc.d myscript.sh defaults
sudo cat > /etc/crontab << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

*/15 * * * * root /mos/ping.sh
EOF
