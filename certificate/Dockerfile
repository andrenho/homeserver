FROM    ubuntu
COPY    resolv.conf /etc/
RUN     apt-get update && \
        apt-get install -y snapd curl unzip jq python3 python3-venv libaugeas0 && \
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
CMD     /app/request_certificate.sh

# TODO - cron

