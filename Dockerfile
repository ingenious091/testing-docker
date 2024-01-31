ARG BASE=python:3.8

FROM ${BASE}

ARG SPLEETER_VERSION=2.3.2
ENV MODEL_PATH /model

RUN mkdir -p /model
RUN apt-get update && apt-get install -y ffmpeg libsndfile1
RUN pip install musdb museval
RUN pip install spleeter==${SPLEETER_VERSION}

COPY audio.mp3 /audio.mp3

ENTRYPOINT ["spleeter", "separate", "-o", "audio_output", "-p", "spleeter:4stems", "/audio.mp3"]
