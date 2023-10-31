#!/bin/bash

cd ${SYSTEM_DEFAULTWORKINGDIRECTORY}/_${BUILD_DEFINITIONNAME}/${BUILD_DEFINITIONNAME}/helm_charts/$AMBIENTE

# Instalando pacote para extrair informações do arquivo values.yaml
pip3 install yq

# Extraindo imagem e tag do arquivo values.yaml
repository=$(/home/AzDevOps/.local/bin/yq -r .deployment.image.repository values.yaml)
tag=$(/home/AzDevOps/.local/bin/yq -r .deployment.image.tag values.yaml)
image_fullname=$repository:$tag

# Pull da imagem com tag e push da imagem como Latest
docker login -u artifact_service_account -p '4gkABd8C6ErdaSXJwlUd' docker.mj.gov.br
docker pull $image_fullname
docker tag $image_fullname $repository:latest
docker push $repository:latest

# Altera a tag para latest no arquivo values.yaml
sed -i "s|$tag|latest|g" values.yaml