# Micro service de Openvpn

Aporte de Argenis Ochoa Gonzalez (@linux8a)

1. create image from dockerfile

docker build -t openvpn-alpine -f ./Dockerfile .

2. Run images

 docker-compose up -d

3. Create certificate

* Nota: Certificate fro server is necesary run firts.

mkdir /etc/openvpn/keys
cp ./vars.example ./vars    #easy-rsa v3
cp ./vars /etc/openvpn/keys #easy-rsa v2

For EasyRSA v3 see: https://community.openvpn.net/openvpn/wiki/EasyRSA

The instructions below are for EasyRSA v2:

If not already done then edit /etc/openvpn/keys/vars
(This file is used for defining paths and other standard settings)

vim /etc/openvpn/keys/vars

    Change KEY_DIR= from "$EASY_RSA/keys" to "/etc/openvpn/keys"
    Change KEY_SIZE, CA_EXPIRE, KEY_EXPIRE, KEY_COUNTRY, KEY_PROVINCE, KEY_CITY, KEY_ORG, KEY_EMAIL to match your system.

source the vars to set properties

source /etc/openvpn/keys/vars

touch /etc/openvpn/keys/index.txt
echo 00 > /etc/openvpn/keys/serial
Set up a 'Certificate Authority' (CA)

Clean up the keys folder.

./clean-all

Generate Diffie Hellman parameters

./build-dh

Now lets make the CA certificates and keys

./build-ca
Set up a 'OpenVPN Server'

Create server certificates

./build-key-server <commonname>
Set up a 'OpenVPN Client'

Create client certificates

./build-key <commonname>
Revoke a certificate

To revoke a certificate

./revoke-full <commonname>

The revoke-full script will generate a CRL (certificate revocation list) file called crl.pem in the keys subdirectory.
The file should be copied to a directory where the OpenVPN server can access it, then CRL verification should be enabled in the server configuration:

crl-verify crl.pem