FROM nginx:stable
ADD ./dist/sgcf/deployment.tar.gz /usr/share/nginx/html
# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 80;/' /etc/nginx/conf.d/default.conf
RUN apt-get update -y
RUN apt-get install -y locales
RUN sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
RUN locale-gen

ENV TZ America/Sao_Paulo
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y tzdata

COPY devops/nginx/default.conf /etc/nginx/conf.d/
COPY devops/nginx/proxy.conf /etc/nginx/

RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx

EXPOSE 80

RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

COPY devops/docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
