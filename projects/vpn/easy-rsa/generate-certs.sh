#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

Version="3.0.8"
File="EasyRSA-${Version}.tgz"

[[ ! -r ${File} ]] && wget https://github.com/OpenVPN/easy-rsa/releases/download/v${Version}/${File}

tar -xvf ${File}

set -x

# Setup CA
./EasyRSA-${Version}/easyrsa init-pki
./EasyRSA-${Version}/easyrsa build-ca nopass
./EasyRSA-${Version}/easyrsa gen-dh

# openvpn-server
./EasyRSA-${Version}/easyrsa gen-req openvpn-server nopass
./EasyRSA-${Version}/easyrsa sign-req server openvpn-server

# windows-client
./EasyRSA-${Version}/easyrsa gen-req windows-client nopass
./EasyRSA-${Version}/easyrsa sign-req client windows-client

vagrant rsync vpn
vagrant provision vpn
