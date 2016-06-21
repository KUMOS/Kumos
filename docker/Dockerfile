FROM nimmis/java:oracle-8-jdk
#Install build dependencies
RUN apt-get update && apt-get install -y maven gcc cmake wget

ARG setupfile
ADD ["$setupfile", "/kaa-node.deb"]
RUN dpkg -i /kaa-node.deb

RUN service kaa-node stop

#Don't prompt for password
RUN sudo echo 'kaa     ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ADD ./config_listener.sh /
RUN chmod 777 /config_listener.sh
EXPOSE 8080 25 20 9888 9889 9997 9999
RUN service kaa-node start
RUN /bin/bash
