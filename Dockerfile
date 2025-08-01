FROM n8nio/n8n:latest

USER root

# Установка ffmpeg, Python и whisper для Alpine Linux
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip git && \
    pip3 install --upgrade pip && \
    pip3 install git+https://github.com/openai/whisper.git

USER node
