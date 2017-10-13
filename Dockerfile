FROM twiliodeved/api-snippets-base:latest

# TODO: figure out a way to do run tests without root user
USER root

ENV RUN_ENV=test

RUN git clone https://github.com/TwilioDevEd/twilio-api-faker.git /twilio-api-faker \
    && cp /twilio-api-faker/keystore/twilio_fake.pem /usr/local/share/ca-certificates/twilio_fake.crt \
    && update-ca-certificates \
    && cd /twilio-api-faker && gradle jar && cd /api-snippets-base

COPY . /src

WORKDIR /src
