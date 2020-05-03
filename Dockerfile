FROM python:3.8-alpine

COPY . /sigal

RUN apk add --no-cache ffmpeg libffi libjpeg-turbo libressl zlib && \
  apk add --no-cache --virtual build-deps build-base git libffi-dev libjpeg-turbo-dev libressl-dev zlib-dev && \
  pip install --no-cache-dir /sigal[all] && \
  apk del build-deps

EXPOSE 8000

ENTRYPOINT ["sigal"]
