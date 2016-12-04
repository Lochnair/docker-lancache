FROM nginx:1.9

RUN mkdir -p /var/lancache/installs && \
    mkdir -p /var/lancache/other && \
    mkdir -p /var/lancache/tmp

VOLUME /var/lancache

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD lancache/nginx.conf /etc/nginx/nginx.conf
ADD lancache/lancache/ /etc/nginx/lancache
ADD lancache/sites/ /etc/nginx/sites/

CMD ["nginx", "-g", "daemon off;"]