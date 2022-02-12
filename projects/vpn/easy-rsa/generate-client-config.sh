#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

function usage {
  echo "$0 client [ client ... ]"
  exit 1
}
[[ $# -lt 1 ]] && usage

CONFIG_DIR="./client-configs/"

[[ ! -d ${CONFIG_DIR} ]] && mkdir -p ${CONFIG_DIR}

KEY_DIR="./pki/"
BASE_CONFIG="./client-base.conf"

for CLIENT in $* ; do

  CLIENT_CONFIG="${CONFIG_DIR}/${CLIENT}.ovpn"

  cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/issued/${CLIENT}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/private/${CLIENT}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${CLIENT_CONFIG}

done
