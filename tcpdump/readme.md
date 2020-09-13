#Microservicio tcpdump

Aporte de Argenis Ochoa Gonzalez (@linux8a)

Use:

docker-compose up -d

*
change combination for tcpdump. Command:

Capture only interface

```
-i ens192  
```

Capture only interface and net

```
-v -s0 -i eth0 -w tpcdump.pcap net 192.168.1.1/24
```

Examine the TCP traffic on the host network with Wireshark

```
-i any -w - | wireshark -k -i -
```

Examine the traffic of Docker container foo with Wireshark

```
 -i any --immediate-mode -w - | wireshark -k -i -
```

or use docker

docker run --rm -it --tty --net=host -v $PWD:/data tcpdump -i any