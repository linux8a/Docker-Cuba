## Gitea

Aporte de Argenis Ochoa Gonzalez (@linux8a)

* This project running  microservices gitea and postgres. Use proxy reverso traefik for expose internet

### Config

```cp envexample .env```

Edit `./env`


* In gitea

For push use por 10022. Port 22 is busy.

* in config for ssh client

Edit this ~/.ssh/config 

'''
Host  gitea
HostName gitea
Port 10022
'''

### Run docker-compose

```
docker-compose up -d
```

:) ready.

Access your declare fqdns in this examples is  https://gitea.unixfree.org


* Donacion:

![Donacion](../.donacion_enzona.png)

o un usd en bitcoin

![Donacion](../.donacion_bitcoin.png)
