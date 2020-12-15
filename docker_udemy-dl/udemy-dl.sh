#!/bin/sh
###  Variables
unset username
unset password

echo -n "Usuario registrado udemy:"
    read username

  printf "Password please: "
    stty -echo
    read password
    stty echo
  printf '\n'

sleep 1
echo "Pegue la url del curso a descargar"
    read url
sleep 2 

docker run -it --rm -v ${PWD}/:/data -e USERNAME=$username -e PASSWORD=$password -e URL=$url udemy-dl
