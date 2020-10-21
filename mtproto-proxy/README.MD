# Microservicio proxy para telegram 

Aporte de Argenis Ochoa Gonzalez (@linux8a)

* Uso

```
docker-compose up -d
```
nota:podemos cambiar el puerto de escucha.

* Miramos el logs para ver la configuracion

```
docker-compose logs mtproto-proxy
```

* Copiemos la config que sera algo asi.

nota: Si cambiamos el puerto debemos a la hora de copiar la config ajustarlo manualmente

```
[+] Using the explicitly passed secret: '00baadf00d15abad1deaa515baadcafe'.
[+] Saving it to /data/secret.
[*] Final configuration:
[*]   Secret 1: 00baadf00d15abad1deaa515baadcafe
[*]   tg:// link for secret 1 auto configuration: : tg://proxy?server=3.14.15.92&port=443&secret=00baadf00d15abad1deaa515baadcafe
[*]   t.me link for secret 1: tg://proxy?server=3.14.15.92&port=443&secret=00baadf00d15abad1deaa515baadcafe
[*]   Tag: no tag
[*]   External IP: 3.14.15.92
[*]   Make sure to fix the links in case you run the proxy on a different port.
```

Disfruten. :)

Sole soy el creador del docker-compose.yml . Nada mas. La imagen es la ofivial de telegram.
Imagen oficial: https://hub.docker.com/r/telegrammessenger/proxy/