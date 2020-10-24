## Microservicio tshark

Aporte de Argenis Ochoa Gonzalez (@linux8a)

Use:

docker-compose up -d

*
change combination for tshark. Command:

Capture only interface

```
-i ens192  
```

Capture only interface and net

```
-i eth0 -w tpcdump.pcap 
```


or use docker

docker run --rm -it --tty --net=host -v $PWD:/data tshark -i any -w tshark.pcap


* Donacion:

![Donacion](../.donacion.png)