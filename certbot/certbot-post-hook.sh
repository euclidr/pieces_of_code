#!/bin/bash
#
# Handle certbot renew post hook.
#
# Triggered by:
#   certbot renew --post-hook certbot-deploy-hook.sh
#
# Doc:
#   --post-hook POST_HOOK
#                         Command to be run in a shell after attempting to
#                         obtain/renew certificates. Can be used to deploy
#                         renewed certificates, or to restart any servers that
#                         were stopped by --pre-hook. This is only run if an
#                         attempt was made to obtain/renew a certificate. If
#                         multiple renewed certificates have identical post-
#                         hooks, only one will be run. (default: None)

set -e
set -o xtrace

echo '------------Certbot renew post post begin--------------------'

# do something like nginx -s reload

echo '------------Certbot renew post post end--------------------'
