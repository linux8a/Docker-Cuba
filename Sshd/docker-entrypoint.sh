#!/bin/sh
if [ -z "${AUTHORIZED_KEYS}"]; then
   echo "Please is necessary public key as AUTHORIZED_KEYS env variable."
   exit 1
fi

echo "Maybe /root/.ssh/authorized_keys "
echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys
