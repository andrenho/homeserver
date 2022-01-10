FROM phusion/baseimage:master-amd64
CMD ["/sbin/my_init"]

COPY init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh && /tmp/init.sh
COPY init-user.sh /tmp/init-user.sh
COPY key.pub /tmp/key.pub
RUN chown dev:dev /tmp/init-user.sh /tmp/key.pub
USER dev
RUN chmod +x /tmp/init-user.sh && /tmp/init-user.sh
USER root
