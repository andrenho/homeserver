FROM phusion/baseimage:master-amd64
CMD ["/sbin/my_init"]

RUN apt-get update -y && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y vim sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
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
