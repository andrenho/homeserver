FROM    ubuntu

COPY    resolv.conf /etc/
RUN     apt-get update && \
        apt-get install -y curl unzip jq python3 python3-venv libaugeas0 cron && \
        python3 -m venv /opt/certbot/ && \
        /opt/certbot/bin/pip install --upgrade pip && \
        /opt/certbot/bin/pip install certbot && \
        ln -s /opt/certbot/bin/certbot /usr/bin/certbot && \
        curl -v "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        ./aws/install

ENV     EMAIL  admin@admin.com
ENV     DOMAIN my.domain.com
ENV     EXTRA_PARAMS ""

WORKDIR /app
COPY    *.sh /app/

COPY    certbot-cron /etc/cron.d/certbot-cron
RUN     chmod 0644 /etc/cron.d/certbot-cron
RUN     touch /var/log/cron.log

CMD     /app/request_certificate.sh && cron && tail -f /var/log/cron.log

# TODO - cron

