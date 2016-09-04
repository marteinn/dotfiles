#!/bin/bash
set -e

# Simple tool for encrypting/decrypting files using openssl

# Usage: vault d key
#   Encrypt: vault e key .env
#   Decrypt: vault d key .env

mode=${1}
key=${2}
file=${3-.env}

openssl aes-256-cbc -$mode -in $file -out tmp-$file.env -k $key
rm $file
mv tmp-$file.env $file
