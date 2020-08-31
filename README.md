# QuartusDocker
Docker file for Quartus 20.1 SE

### Select source files

- Local files

  ```dockerfile
  COPY files/ /root/
  ```

- Download from internet

  ```dockerfile
  RUN cd /root/quartus &&\
  	wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/QuartusSetup-20.1.0.711-linux.run -O QuartusSetup-20.1.0.711-linux.run &&\
  	wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/cyclonev-20.1.0.711.qdz -O cyclonev-20.1.0.711.qdz
  ```

  To select, you need to uncomment the corresponding lines

### Build container

```bash
docker image build -t <tag name> .
```

### Run container

```bash
docker run --rm -ti --net=host -e DISPLAY=host.docker.internal:0 -e LM_LICENSE_FILE=<path to license file> -e LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4 -v <path to shared dir>:/build <image name>
```

### JTAG

To work with JTAG, you need an installed jtagserver on the host