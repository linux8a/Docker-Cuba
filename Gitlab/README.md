## Run Service Gitlab

Aporte de Argenis Ochoa Gonzalez (@linux8a)

* This project running  microservices gitlab

All trafic is rediregir ssl por 443


* Generate cert openssl

openssl  req -newkey rsa:4096 -nodes -sha256 -keyout ngnix/certs/gitlab.key -x509 -days 365 -out ngnix/certs/gitlab.crt

* Config ngnix redirige all trafic 80 to 443

* In gitlab

For push use por 10022. POr 22 is busy.

* in config for ssh client

Edit this ~/.ssh/config 

'''
Host  gitlab
HostName gitlab
Port 10022
User argochoa
'''
