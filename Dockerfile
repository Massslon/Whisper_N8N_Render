FROM n8nio/n8n

USER root

# Установка ffmpeg и whisper
RUN apt-get update && apt-get install -y ffmpeg python3-pip && \
    pip install git+https://github.com/openai/whisper.git

USER node
