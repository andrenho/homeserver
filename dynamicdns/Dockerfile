FROM python:3-alpine
WORKDIR /code
ENV PUBLIC_IP_WS https://api.ipify.org/
ENV RECORD_NAME homeserver.gamesmith.uk
ENV ZONE_ID Z1E6IX3AW27X6H
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY _aws_config /root/.aws/config
COPY dynamicdns.py .
ENTRYPOINT ["python", "dynamicdns.py"]
