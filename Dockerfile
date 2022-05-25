FROM alpine:3.16.0

ENV AWS_CLI_VER=2.1.39

RUN apk update && \
    apk add --no-cache curl gcompat zip && \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install

CMD mkdir /root/.aws
#COPY creds/credentials /root/.aws/credentials
COPY config /root/.aws/config
