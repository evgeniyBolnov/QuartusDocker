# QuartusDocker
Docker file for Quartus 20.1 SE

### Select source files

- Local files

  ```dockerfile
  COPY files/ /root/
  ```

  and copy Quartus setup file to `./files/quartus`

- Download from internet

  ```dockerfile
  RUN cd /root/quartus &&\
    wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/QuartusSetup-20.1.0.711-linux.run -O QuartusSetup-20.1.0.711-linux.run &&\
    wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/cyclonev-20.1.0.711.qdz -O cyclonev-20.1.0.711.qdz &&\
    wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/arriav-20.1.0.711.qdz -O arriav-20.1.0.711.qdz &&\
    wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/max-20.1.0.711.qdz -O max-20.1.0.711.qdz &&\
    wget http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_installers/max10-20.1.0.711.qdz -O max10-20.1.0.711.qdz
  ```
  
  To select, you need to uncomment the corresponding lines

### Build container

```bash
docker image build -t <tag name> .
```

### Run container

```bash
docker run --rm -ti --net=host -e DISPLAY=host.docker.internal:0 ^
                               -e LM_LICENSE_FILE=<path to license file> ^
                               -v <path to shared dir>:/build ^
                               <image name>
```

### JTAG

To work with JTAG, you need an installed jtagserver on the host