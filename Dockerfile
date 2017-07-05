FROM joliveros/api-snippets-base:base

USER root

ENV RUN_ENV=test

COPY . /src

WORKDIR /src

RUN /bin/bash --login -c "rvm gemset create api-snippets && rvm use ruby-2.4.1@api-snippets --default && gem install bundler json colorize nokogiri"

RUN /bin/bash --login -c "ruby ./tools/snippet-testing/model/dependency.rb"

RUN make save_dependencies

RUN /bin/bash --login -c "make start && ruby ./tools/snippet-testing/snippet_tester.rb"
