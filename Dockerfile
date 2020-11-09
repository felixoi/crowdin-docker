FROM alpine:latest
MAINTAINER Felix Kleinekathoefer <dev@felixoi.com>

ARG CLI_VERSION

RUN apk add --no-cache openjdk11-jre

RUN mkdir /crowdin && \
    cd /crowdin && \ 
    wget -O crowdin.zip https://github.com/crowdin/crowdin-cli/releases/download/${CLI_VERSION}/crowdin-cli.zip && \
    unzip crowdin.zip && \
    rm crowdin.zip && \
    cd $(ls) && \
    ./install-crowdin-cli.sh && \
    rm -rf /crowdin

RUN crowdin -V
