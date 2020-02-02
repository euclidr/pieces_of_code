#!/bin/bash
#
# Handle certbot renew deploy hook.
# 
# Triggered by:
#   certbot renew --deploy-hook certbot-deploy-hook.sh
#   --deploy-hook DEPLOY_HOOK
#                         Command to be run in a shell once for each
#                         successfully issued certificate. For this command, the
#                         shell variable $RENEWED_LINEAGE will point to the
#                         config live subdirectory (for example,
#                         "/etc/letsencrypt/live/example.com") containing the
#                         new certificates and keys; the shell variable
#                         $RENEWED_DOMAINS will contain a space-delimited list
#                         of renewed certificate domains (for example,
#                         "example.com www.example.com" (default: None)
#
# Input example:
#   RENEWED_LINEAGE="/etc/letsencrypt/live/example.net-0001"
#   RENEWED_DOMAINS="example.net *.example.net"

set -e
set -o xtrace

echo '------------Certbot renew deploy hook begin--------------------'


# TODO Change to actual folder that store server SSL certificates
SERVER_SSL_ROOT="/data/certs/server-ssl"
CERT_FOLDER_NAME=$(basename $RENEWED_LINEAGE)
CERT_FOLDER_PATH="${SERVER_SSL_ROOT}/${CERT_FOLDER_NAME}"
CERT_DOMAINS_FILE_PATH="${CERT_FOLDER_PATH}/DOMAINS.txt"

mkdir -p $CERT_FOLDER_PATH

cp -R -L "${RENEWED_LINEAGE}/." "${CERT_FOLDER_PATH}/"

# Write domain list file
IFS=' ' read -ra DOMAIN_ARRAY <<< "${RENEWED_DOMAINS}"

for i in "${DOMAIN_ARRAY[@]}"
do
    echo "$i"
done >"${CERT_DOMAINS_FILE_PATH}"


echo '------------Certbot renew deploy hook end--------------------'
