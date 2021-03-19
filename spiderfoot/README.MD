## Microservice Spiderfoot

Nota: Modificate dockerfile for linux8a@gmail.com

* fix in version pip. Solucion upgrade pip version stable. Add this line en dockerfile [pip3 install --upgrade pip ]


* Usage:

docker-compose up -d

or docker cli

```
   sudo docker build -t spiderfoot .
   sudo docker run -p 5001:5001 spiderfoot
```

* Using Docker volume for spiderfoot data

```
   sudo docker run -p 5001:5001 -v /mydir/spiderfoot:/var/lib/spiderfoot spiderfoot
```

* Using SpiderFoot remote command line with web server

```
   docker run --rm -it spiderfoot sfcli.py -s http://my.spiderfoot.host:5001/
```

* Running spiderfoot commands without web server (can optionally specify volume)

```
   sudo docker run --rm spiderfoot sf.py -h
```

* Running spiderfoot unit tests in container

```   
   sudo docker run --rm spiderfoot -m unittest discover -s test/unit
```

* Donacion:

![Donacion](../.donacion_enzona.png)

o un usd en bitcoin

![Donacion](../.donacion_bitcoin.png)

### Fork :)

https://github.com/linux8a/spiderfoot


