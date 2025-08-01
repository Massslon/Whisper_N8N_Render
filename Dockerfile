FROM n8nio/n8n:latest

USER root

# Добавляем совместимость с glibc и необходимые пакеты
RUN apk update && \
    apk add --no-cache ffmpeg python3 py3-pip git libc6-compat && \
    pip3 install --upgrade pip && \
    pip3 install git+https://github.com/openai/whisper.git

USER node
