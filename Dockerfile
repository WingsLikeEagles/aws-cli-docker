FROM alpine:3.12.1

RUN apk add aws-cli

CMD mkdir /root/.aws
#COPY creds/credentials /root/.aws/credentials
COPY config /root/.aws/config
