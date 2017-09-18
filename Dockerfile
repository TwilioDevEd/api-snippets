FROM twiliodeved/api-snippets-base

USER root

ENV RUN_ENV=test

COPY . /src

WORKDIR /src

RUN pip install yapf flake8

RUN /bin/bash --login -c "rvm gemset create api-snippets && rvm use ruby-2.4.1@api-snippets --default && gem install bundler json colorize nokogiri rubocop"

RUN /bin/bash --login -c "make install_dependencies"

ENV REQUESTS_CA_BUNDLE=/usr/local/share/ca-certificates/twilio_fake.crt

# RUN /usr/local/lib/python3.5/site-packages/certifi/cacert.pem >> $REQUESTS_CA_BUNDLE

RUN make save_dependencies
