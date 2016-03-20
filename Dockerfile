FROM nginx:1.9

RUN mkdir -p /cache/installs && \
    mkdir -p /cache/other && \
    mkdir -p /cache/tmp

ADD nginx.conf /etc/nginx/nginx.conf
ADD lancache/lancache/ /etc/nginx/lancache
ADD lancache/sites/ /etc/nginx/sites/