FROM    ubuntu
COPY    resolv.conf /etc/
RUN     apt-get update && \
        apt-get install -y certbot curl unzip && \
        curl -v "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        ./aws/install
WORKDIR /app
COPY    *.sh /app/
CMD     /app/request_certificate.sh

# TODO - cron

