FROM python:3.11-slim

ENV PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIPELINE=True \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    HOME=/home/user
WORKDIR /home/user

RUN pip install konsave
