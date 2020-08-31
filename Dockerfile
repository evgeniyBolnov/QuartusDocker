FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y wget locales libglib2.0-0 libsm6 libxrender1 \
                                                                      libxext6 libxtst6 libxi6 libfreetype6 \
                                                                      libfontconfig libtcmalloc-minimal4 \
                                                                      openjdk-11-jre libgtk2.0-0 make &&\
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

#COPY files/ /root/

#RUN cd /root/quartus &&\
#	wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/QuartusSetup-20.1.0.711-linux.run -O QuartusSetup-20.1.0.711-linux.run &&\
#	wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/cyclonev-20.1.0.711.qdz -O cyclonev-20.1.0.711.qdz

RUN cd /root/quartus &&\
	chmod +x ./QuartusSetup-20.1.0.711-linux.run &&\
    ./QuartusSetup-20.1.0.711-linux.run  --mode unattended --unattendedmodeui minimal --accept_eula 1 --installdir /root/intelFPGA/20.1/ &&\
	cd /root &&\
	rm -rf quartus

RUN cd /root/intelFPGA/20.1/nios2eds/bin &&\
	wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/2/eclipse-cpp-mars-2-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz &&\
	tar xf eclipse.tar.gz &&\
	mv eclipse eclipse_nios2 &&\
	tar xf eclipse_nios2_plugins.tar.gz &&\
	rm eclipse.tar.gz

RUN cd /root/intelFPGA/20.1/quartus/bin &&\
	./jtagconfig --addserver "host.docker.internal" "passwd"