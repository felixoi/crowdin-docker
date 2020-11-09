FROM alpine:latest
MAINTAINER Felix Kleinekathoefer <dev@felixoi.com>

RUN apk add --no-cache openjdk11-jre

RUN mkdir /crowdin && \
    cd /crowdin && \ 
    wget -O crowdin.zip https://downloads.crowdin.com/cli/v3/crowdin-cli.zip && \
    unzip crowdin.zip && \
    rm crowdin.zip && \
    cd $(ls) && \
    ./install-crowdin-cli.sh && \
    rm -rf /crowdin

