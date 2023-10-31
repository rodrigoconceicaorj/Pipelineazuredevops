#!/bin/bash
echo 'EXECUTANDO ENTRYPOINT'

##REPLACE ENVIROMENTS
cp /usr/share/nginx/html/assets/env.js /usr/share/nginx/html/assets/env.js.tmp
envsubst < /usr/share/nginx/html/assets/env.js.tmp > /usr/share/nginx/html/assets/env.js
rm /usr/share/nginx/html/assets/env.js.tmp

exec nginx -g 'daemon off;'
