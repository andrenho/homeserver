FROM phusion/baseimage:master-amd64
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
RUN apt-get update -y && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y && \
        vim sudo git build-essential autotools-dev automake gdb autoconf plantuml && \
        ruby python3 lua5.3 nodejs gcc-avr clang linux-headers-generic && \
    apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY key.pub /tmp/key.pub
RUN useradd --create-home --shell /bin/bash dev && \
    usermod -p '*' dev && \
    adduser dev sudo && \
    rm -f /etc/service/sshd/down && \
    chown dev /tmp/key.pub
USER dev
RUN mkdir ~/.ssh && \
    cat /tmp/key.pub >> ~/.ssh/authorized_keys && rm -f /tmp/key.pub && \
    chmod 700 ~/.ssh && \
    chmod 600 ~/.ssh/authorized_keys
USER root
