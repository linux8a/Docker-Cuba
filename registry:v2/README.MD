# Microservicio local registry

Use

```
docker-compose up -d
```

Create registry local and use registry proxy remote docker.uclv.cu. 
Note: This url is not always free for mobile 

## Si deseas crear un registry mirror de docker, k8s, gcr

crea registry-proxy.sh
chmod +x registry-proxy.sh

```sh
#!/usr/bin/env bash

set -e

docker run -d -p 5000:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
    --restart always \
    --name registry-docker.io registry:2

docker run -d -p 5001:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://registry.k8s.io \
    --restart always \
    --name registry.k8s.io registry:2

docker run -d -p 5003:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://gcr.io \
    --restart always \
    --name registry-gcr.io registry:2

docker run -d -p 5004:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://ghcr.io \
    --restart always \
    --name registry-ghcr.io registry:2
```

* Donacion:

![Donacion](../.donacion_enzona.png)

o un usd en bitcoin

![Donacion](../.donacion_bitcoin.png)
