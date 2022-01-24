#!/bin/bash
export KV_NAME=${1:-$(terraform output kv_name)}
source ../scripts/fetch-kubeconfig.sh
echo $KUBECONFIG
az keyvault secret show --name node-key --vault-name $KV_NAME | jq -r '.value' > rke2.priv_key
chmod 400 rke2.priv_key
