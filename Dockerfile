FROM twiliodeved/api-snippets-base:latest

# TODO: figure out a way to do run tests without root user
USER root

ENV RUN_ENV=test

COPY . /src

WORKDIR /src

RUN make install_api_faker
