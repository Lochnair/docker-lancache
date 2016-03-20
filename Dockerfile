FROM nginx:alpine

ADD nginx.conf /etc/nginx/nginx.conf
ADD lancache/lancache/ /etc/nginx/lancache
ADD lancache/sites/ /etc/nginx/sites/