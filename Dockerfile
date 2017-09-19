FROM twiliodeved/api-snippets-base

ARG SNIPPET_LANGUAGE

# TODO: figure out a way to do run tests without root user
USER root

ENV RUN_ENV=test

COPY . /src

WORKDIR /src

RUN /bin/bash --login -c "make start && make run_tests"
