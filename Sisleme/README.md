# Microservicio Sisleme

* Creado por Argenis Ochoa (@linux8a)
* Sugerido por Tony (@smeagol1989)

Descomprimir la carpeta sisleme.rar en la carpeta apps. Ojo todo debe estar debajo de apps debe quedar asi.

```
apps
 |------> app
 |        |--> cache
 |        |--> config
 |        |--> logs
 |        \--> Resources
 |----->  bin
 |-----> src
 |-----> wendor
  \----> web
```

# env

copiar envexamples 

cp envexamples .env 

  # correr

  docker-compose up -d