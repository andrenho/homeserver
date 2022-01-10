FROM phusion/baseimage:master-amd64
CMD ["/sbin/my_init"]

ENV TZ=America/Sao_Paulo
COPY init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh && /tmp/init.sh
COPY key.pub /key.pub

COPY init-user.sh /etc/my_init.d/init-user.sh
RUN chmod +x /etc/my_init.d/init-user.sh

COPY .bashrc /
COPY .dir_colors /
COPY .inputrc /
COPY .tmux.conf /
COPY .vimrc /
RUN chown dev:dev /.bashrc /.dir_colors /.inputrc /.tmux.conf /.vimrc
