FROM python:3-alpine
WORKDIR /code
ENV PUBLIC_IP_WS=https://api.ipify.org/
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY updateip.py .
CMD ["python", "updateip.py"]
