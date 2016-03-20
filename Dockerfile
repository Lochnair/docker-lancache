FROM nginx:1.9

RUN mkdir -p /cache/installs && \
    mkdir -p /cache/other && \
    mkdir -p /cache/tmp

VOLUME /cache

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD lancache/nginx.conf /etc/nginx/nginx.conf
ADD lancache/lancache/ /etc/nginx/lancache
ADD lancache/sites/ /etc/nginx/sites/