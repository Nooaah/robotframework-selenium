FROM debian:latest

RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install robotframework

CMD tail -f /dev/null