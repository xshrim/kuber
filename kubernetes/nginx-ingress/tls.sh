#!/bin/bash
KEY_FILE="$1"
: ${KEY_FILE:="tls.key"}
CERT_FILE="$2"
: ${CERT_FILE:="tls.pem"}
HOST="$3"
: ${HOST:="ebtech"}
CERT_NAME="$4"
: ${CERT_NAME:="ingress-tls"}
NAMESPACE="$5"
: ${NAMESPACE:="ingress-nginx"}

# 生成根证书及其密钥
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}" 

# 导入根证书及其密钥
kubectl -n ${NAMESPACE} create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
