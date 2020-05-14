FROM alpine:latest
LABEL maintainer="linux8a@gmail.com"

RUN apk update \
   && apk add openssh curl rsync wget axel bash sudo \
   && rm -rf /var/cache/apk/*
RUN mkdir /root/.ssh \
&& chmod 0700 /root/.ssh \
&& ssh-keygen -A \
&& sed -i s/#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
&& sed -i s/#PermitRootLogin\ prohibit-password/PermitRootLogin\ prohibit-password/ /etc/ssh/sshd_config \
&& sed -i s/#PubkeyAuthentication\ yes/PubkeyAuthentication\ yes/ /etc/ssh/sshd_config \
&& sed -i s/AuthorizedKeysFile\/#/ /etc/ssh/sshd_config \
&& echo "AuthorizedKeysFile .ssh/authorized_keys ~/.ssh/authorized_keys" >> /etc/ssh/sshd_config 

#WORKDIR /home/alpine/
RUN addgroup alpine \
&& adduser -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine  ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN chown -R alpine:alpine /home/alpine 

EXPOSE 22/tcp
CMD ["/usr/sbin/sshd", "-D", "-e"]
   