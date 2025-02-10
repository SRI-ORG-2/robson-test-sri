#!/bin/bash

ID_TOKEN=$(curl -H "Metadata-Flavor: Google" \
"http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=https://europe-north1-abax-build.cloudfunctions.net/get-secret")  

curl -H "Authorization: Bearer $ID_TOKEN" https://europe-north1-abax-build.cloudfunctions.net/get-secret > /tmp/config  

if [ $? -eq 0 ]; then  
    # Sucesso
    export KUBECONFIG=/tmp/config  
fi
