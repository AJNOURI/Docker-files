FROM alpine

## To run the server /usr/sbin/lighttpd -f lighttpd.conf
RUN apk update
RUN apk add lighttpd
ADD index.html /var/www/localhost/htdocs/index.html
ADD haproxy.cfg haproxy.cfg
