# Docker Bench for Security

![Docker Bench for Security running](benchmark_log.png)

The Docker Bench for Security is a script that checks for dozens of common
best-practices around deploying Docker containers in production. The tests are
all automated, and are inspired by the [CIS Docker Benchmark v1.2.0](https://www.cisecurity.org/benchmark/docker/).

We are making this available as an open-source utility so the Docker community
can have an easy way to self-assess their hosts and docker containers against
this benchmark.
## Git Oficial 
https://github.com/docker/docker-bench-security.gi

## Running Docker Bench for Security

We packaged docker bench as a small container for your convenience. Note that
this container is being run with a *lot* of privilege -- sharing the host's
filesystem, pid and network namespaces, due to portions of the benchmark
applying to the running host.

The easiest way to run your hosts against the Docker Bench for Security is by
running our pre-built container:

```sh
docker run -it --net host --pid host --userns host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /etc:/etc:ro \
    -v /usr/bin/containerd:/usr/bin/containerd:ro \
    -v /usr/bin/runc:/usr/bin/runc:ro \
    -v /usr/lib/systemd:/usr/lib/systemd:ro \
    -v /var/lib:/var/lib:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --label docker_bench_security \
    docker/docker-bench-security
```
or

```sh
docker-compose run --rm docker-bench-security
```

Don't forget to adjust the shared volumes according to your operating system.
Some examples are:


Docker bench requires Docker 1.13.0 or later in order to run.

Note that when distributions doesn't contain `auditctl`, the audit tests will
check `/etc/audit/audit.rules` to see if a rule is present instead.

Distribution specific Dockerfiles that fixes this issue are available in the
[distros directory](https://github.com/docker/docker-bench-security/tree/master/distros).

The [distribution specific Dockerfiles](https://github.com/docker/docker-bench-security/tree/master/distros)
may also help if the distribution you're using haven't yet shipped Docker
version 1.13.0 or later.


## Building Docker Bench for Security

If you wish to build and run this container yourself, you can follow the
following steps:

```sh
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
docker build --no-cache -t docker-bench-security .
```

followed by an appropriate `docker run` command as stated above
or use [Docker Compose](https://docs.docker.com/compose/):

```sh
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
docker-compose run --rm docker-bench-security
```

Also, this script can also be simply run from your base host by running:

```sh
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
sudo sh docker-bench-security.sh
```

This script was built to be POSIX 2004 compliant, so it should be portable
across any Unix platform.
