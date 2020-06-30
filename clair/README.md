```bash
$ curl -L https://raw.githubusercontent.com/coreos/clair/master/docker-compose.yaml.sample -o $PWD/docker-compose.yaml
$ mkdir $PWD/clair_config
$ curl -L https://raw.githubusercontent.com/coreos/clair/master/config.yaml.sample -o $PWD/clair_config/config.yaml
$ docker-compose -f docker-compose.yaml up -d
```