FROM node:20-bullseye

# Установка Python, ffmpeg, pip и Whisper
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip git && \
    pip3 install --upgrade pip && \
    pip3 install git+https://github.com/openai/whisper.git

# Установка n8n
RUN npm install --location=global n8n

# Создание рабочей директории
RUN mkdir /root/.n8n

# Открываем порт
EXPOSE 5678

# Запуск
CMD ["n8n"]
