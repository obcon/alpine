FROM scratch
ADD alpine-minirootfs-3.5.2-x86_64.tar.gz /
ADD rootfs /

RUN apk update && \
  apk upgrade && \
  apk add \
    ca-certificates \
    curl \
    bash \
    bash-completion \
    ncurses \
    gettext \
    tar \
    mg \
    unzip \
    jq \
    s6 \
    rsync && \
  rm -rf /var/cache/apk/* && \
  update-ca-certificates

RUN adduser -u 4096 -D obcon -s /bin/bash
RUN cp /root/.bashrc /home/obcon && \
  chown -R 4096:4096 /home/obcon

USER obcon
WORKDIR /home/obcon

CMD ["/bin/bash"]
