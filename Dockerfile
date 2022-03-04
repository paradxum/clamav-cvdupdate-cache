FROM python:3-alpine

RUN apk add --no-cache clamav clamav-libunrar nginx

COPY entrypoint.sh /sbin
COPY run_cvd_update.sh /sbin
COPY nginx.conf /etc/nginx

RUN mkdir /run/clamav && \
    chmod 0777 /run/nginx /run/clamav && \
    mkdir -p /var/lib/clamav && \
    chown -R clamav:clamav /var/lib/clamav && \
    pip3 install cvdupdate && \
    cvd config set --dbdir /var/lib/clamav && \
    echo "1 */4 * * * /sbin/run_cvd_update.sh" >>/etc/crontabs/root

CMD [ "/sbin/entrypoint.sh" ]

