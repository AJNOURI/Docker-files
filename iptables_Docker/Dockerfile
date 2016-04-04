FROM alpine:3.1
RUN apk update
RUN apk add iptables
RUN apk add ip6tables
RUN apk add iptables-doc
RUN apk add iproute2
RUN apk add drill
RUN apk add iputils
RUN apk add bash
ADD startup.sh startup.sh
ENTRYPOINT ["bash startup.sh"]
