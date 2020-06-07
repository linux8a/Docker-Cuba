## Microservice gogs (Git Server)

Aporte de Argenis Ochoa Gonzalez (@linux8a)

A painless self-hosted Git service
Easy to install

Simply run the binary for your platform. Or ship Gogs with Docker or Vagrant, or get it packaged.
Cross-platform

Gogs runs anywhere Go can compile for: Windows, macOS, Linux, ARM, etc. Choose the one you love!
Lightweight

Gogs has low minimal requirements and can run on an inexpensive Raspberry Pi. Save your machine energy!
Open Source


* run :)

docker-compose up -d

# Environment

    SOCAT_LINK:
        Possible value: true, false, 1, 0
        Default: true
        Action: Bind linked docker container to localhost socket using socat. Any exported port from a linked container will be binded to the matching port on localhost.
        Disclaimer: As this option rely on the environment variable created by docker when a container is linked, this option should be deactivated in managed environment such as Rancher or Kubernetes (set to 0 or false)
    RUN_CROND:
        Possible value: true, false, 1, 0
        Default: false
        Action: Request crond to be run inside the container. Its default configuration will periodically run all scripts from /etc/periodic/${period} but custom crontabs can be added to /var/spool/cron/crontabs/.
    BACKUP_INTERVAL:
        Possible value: 3h, 7d, 3M
        Default: null
        Action: In combination with RUN_CROND set to true, enables backup system.
        See: Backup System
    BACKUP_RETENTION:
        Possible value: 360m, 7d, ...m/d
        Default: 7d
        Action: Used by backup system. Backups older than specified in expression are deleted periodically.
        See: Backup System
    BACKUP_ARG_CONFIG:
        Possible value: /app/gogs/example/custom/config
        Default: null
        Action: Used by backup system. If defined, supplies --config argument to gogs backup.
        See: Backup System
    BACKUP_ARG_EXCLUDE_REPOS:
        Possible value: test-repo1, test-repo2
        Default: null
        Action: Used by backup system. If defined, supplies --exclude-repos argument to gogs backup.
        See: Backup System

Backup System

Automated backups with retention policy:

    BACKUP_INTERVAL controls how often the backup job runs and supports interval in hours (h), days (d), and months (M), eg. 3h, 7d, 3M. The lowest possible value is one hour (1h).
    BACKUP_RETENTION supports expressions in minutes (m) and days (d), eg. 360m, 2d. The lowest possible value is 60 minutes (60m).
