## Microservice Traefik

Aporte de Argenis Ochoa Gonzalez (@linux8a)

Paso 1: Configurar y ejecutar Traefik

1. Pasword

Genere la contraseña con htpasswd. Sustituya secure_password por la contraseña que desee usar para el usuario de administración Traefik:

    htpasswd -nb admin secure_password

2. Config Traefik

   vi traefik.toml


3. Crear la Red

    docker network create outsite-network

Cuando se inicie el contenedor Traefik, lo añadiremos a esta red. Luego podremos añadir a esta red contenedores, para los cuales Traefik actuará como proxy.

A continuación, cree un archivo vacío que contendrá nuestra información de Let´s Encrypt. Compartiremos este archivo en el contenedor para que Traefik pueda usarlo:

    touch acme.json

Traefik solo podrá usar este archivo si el usuario root dentro del contenedor tiene acceso exclusivo de lectura y escritura a este. Para hacer esto, bloquee los permisos en acme.json para que solo el propietario del archivo tenga permisos de lectura y escritura.

    chmod 600 acme.json


4. En los demas docker compose es importante que se declare la red outsite-network

networks:
    # everything that is *only* on "internal network" cannot talk to WAN
  internal-network:
    external: false
  # add this network to a container to make it talk to the rest of the world
  traefik:
    external: 
      name: outside-network


o asi

networks: 
  internal-network:
    external: false
  outside-network:
    external: true



5. en el Servicio debemos poner la etiqueta Label

labels:
      - "traefik.backend=app"
      - "traefik.frontend.rule=Host:chat.unixfree.org"
      - "traefik.docker.network=outside-network"
      - "traefik.port=8065"
