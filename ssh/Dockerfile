FROM python:3.7-slim
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/huashengdun/webssh.git && \
    groupadd -r webssh && \
    useradd -r -s /bin/false -g webssh webssh && \
    chown -R webssh:webssh /webssh && \
    cd webssh && \
    pip install -r requirements.txt
USER webssh
EXPOSE 8080
WORKDIR /webssh
COPY UbuntuMono-R.ttf /webssh/webssh/static/css/fonts/UbuntuMono-R.ttf
CMD ["python", "run.py", "--address=0.0.0.0", "--port=8080", "--font=UbuntuMono-R.ttf", "--xsrf=False", "--origin='*'"]
