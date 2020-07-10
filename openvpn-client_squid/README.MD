# Microservice Openvpn client and squid
Aporte de Argenis Ochoa Gonzalez (@linux8a)

This microservice allow you access content block in your localitation. ;-)  

* This create and run service squid and run direct openvpn.

* fix squid. Solution asignet permition 777 file squid. (chmod 777 squid -Rv) inside folder log and cache.

* ajusting your client vpn config.
(ip and port and cert)

**********
vpnclient:
    image: openvpn-client
    cap_add:
      - net_admin
    networks:
      - default
    read_only: true
    tmpfs:
      - /run
      - /tmp
    restart: unless-stopped
    security_opt:
      - label:disable
    stdin_open: true
    tty: true
    ports: 
      - '3128:3128'
    volumes:
      - /dev/net:/dev/net:z
      - ./openvpn/client.ovpn:/vpn/client.ovpn
  
  squid:
    image: squid
    volumes:
      - ./squid/cache:/var/cache/squid
      - ./etc/squid.conf:/etc/squid/squid.conf:ro
      - ./squid/log:/var/log/squid:rw
      - /etc/localtime:/etc/localtime:ro
    shm_size: 1G
    restart: always  
    depends_on:
      - vpnclient
    network_mode: "service:vpnclient"   # The magic is in this line
    stdin_open: true
    tty: true
    *******