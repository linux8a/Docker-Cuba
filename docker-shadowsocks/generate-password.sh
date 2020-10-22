#!/bin/bash

function generatePassword() {
   openssl rand -base64 28
}

PASSWORD=$(generatePassword)

sed -i.bak \
    -e "s#PASSWORD=.*#PASSWORD=${PASSWORD}#g" \
    "$(dirname "$0")/.env"
