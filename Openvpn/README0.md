# Micro service de Openvpn

Aporte de Argenis Ochoa Gonzalez (@linux8a)

1. Crear la imagen a partir del Dockerfile

docker build -t openvpn-alpine -f ./Dockerfile .

2. Correr la imagen

 docker-compose up -d

 3. Si deseamos podemos modificar el config del server

 /etc/openvpn/server.conf

 Si no deseamos que los clientes tengan internet conectado al vpn
 Cambiar esta lineas por el segmento de nuestra red y por la TCP/IP de nuestro server dns ejemplo hipotetico

push "route 192.168.66.0 255.255.255.0"
push "dhcp-option DNS 192.168.66.101"