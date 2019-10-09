FROM alpine:latest
MAINTAINER houlong_66@163.com

ENV VERSION 0.29.0
ENV DOWNLOAD_URL https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz

RUN wget --no-check-certificate ${DOWNLOAD_URL} \
    && tar -zxf frp_${VERSION}_linux_amd64.tar.gz \
    && mv frp_${VERSION}_linux_amd64/frpc /usr/bin \
    && rm -rf frp_${VERSION}_linux_amd64.tar.gz \
        frp_${VERSION}_linux_amd64

CMD ["frpc", "-c", "/etc/frpc.ini"]