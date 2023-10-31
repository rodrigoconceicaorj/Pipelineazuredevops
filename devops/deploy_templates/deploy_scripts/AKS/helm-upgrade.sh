#!/bin/bash

cd ${SYSTEM_DEFAULTWORKINGDIRECTORY}/_${BUILD_DEFINITIONNAME}/${BUILD_DEFINITIONNAME}/helm_charts/$AMBIENTE

docker pull docker.mj.gov.br/fabrica/devops/kubernetes/helm-chart:2.6

docker run -i --rm \
-e "CLIENT_ID=$CLIENT_ID" \
-e "SCOPE=$SCOPE" \
-e "CLIENT_SECRET=$CLIENT_SECRET" \
-e "TENANT_ID=$TENANT_ID" \
-e "URL_KEYVAULT=$URL_KEYVAULT" \
-e "PROJECT=$PROJECT" \
-e "HELM_RELEASE_NAME"=$HELM_RELEASE_NAME \
-e "CLUSTER=$CLUSTER" \
-e "AMBIENTE=$AMBIENTE" \
-v $(pwd):/opt/app \
docker.mj.gov.br/fabrica/devops/kubernetes/helm-chart:2.6
