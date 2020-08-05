## Micro service Check Spetre and Melton and script Ansible

Aporte de Argenis Ochoa Gonzalez (@linux8a

## Docker

[Docker-compose](./docker)

nota: No soy el creador de este script.
Solo hice un fork apuntando https://github.com/linux8a/spectre-meltdown-checker
En el dockerfile para el canal solo he ajustado la version del alpine para que use la 3.12 :)

RUN:

docker-compose up 

## Ansible

[Script ansible](./ansible)

Tomando la idea del docker he creado una variante para usarla en ansible a fin de verificar si mis equipos son vulnerables.

Uso:

Edita el archivo inventory y agrega los servidores a escanear.(Los server deben de tener la llave publica ssh del usuario a ejecutar [ssh-copy-id -i ~/.ssh/id_rsa.pub user@[IP of the management system]]) Edita el check_spectre-meltdown.yml y en host pon el alias o grupo de tu inventary

ansible-playbook check_spectre-meltdown.yml
