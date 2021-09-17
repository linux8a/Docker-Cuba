# Microservicio Watchtower
Aporte de Argenis Ochoa Gonzalez (@linux8a)


Este microservicio es usado para monitorear las imagenes y si sale una actualizacion bajarla automaticamente. Si no deseasmos que un microservicio se actualize
automaticamente debemos usar este label en el:

labels: 
  - "com.centurylinklabs.watchtower.enable=false"



  ```
  services:
  watchtower:
    command: --label-enable --cleanup --interval 300
    image: containrrr/watchtower
    labels:
      - "com.centurylinklabs.watchtower.enable=true"
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - TZ=America/Havana
      #- WATCHTOWER_CLEANUP=true # deleting old unused images automatically
      # optional for notifications
      #- WATCHTOWER_NOTIFICATIONS=email
      #- WATCHTOWER_NOTIFICATION_EMAIL_FROM=${EMAIL_FROM}
      #- WATCHTOWER_NOTIFICATION_EMAIL_TO=${WATCHTOWER_EMAIL_TO}
      #- WATCHTOWER_NOTIFICATION_EMAIL_SERVER=${SMTP_SERVER}
      #- WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=${SMTP_PORT}
      #- WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=${SMTP_USER}
      #- WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=${SMTP_PASSWORD}
      # alternative for notification via pushover
      #- WATCHTOWER_NOTIFICATIONS=shoutrrr
      #- WATCHTOWER_NOTIFICATION_URL=pushover://shoutrrr:${PO_TOKEN}@${PO_USERKEY}
    ```

    env
```
EMAIL_FROM=user@gmail.com
WATCHTOWER_EMAIL_TO=toimaul@gmail.com
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=user@gmail.com
SMTP_PASSWORD=passwd
```

Si deseas usar el cron  asignandole una hora exacta puedes usar este environment

```
    environment:
      WATCHTOWER_SCHEDULE: 0 0 2 * * *
      TZ: America/Havana

```

* Donacion:

![Donacion](../.donacion_enzona.png)

o un usd en bitcoin

![Donacion](../.donacion_bitcoin.png)
