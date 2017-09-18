FROM twiliodeved/api-snippets-base

USER root

ENV RUN_ENV=test

COPY . /src

WORKDIR /src

RUN /bin/bash --login -c "rvm gemset create api-snippets && rvm use ruby-2.4.1@api-snippets --default && gem install bundler json colorize nokogiri rubocop"

RUN /bin/bash --login -c "ruby ./tools/snippet-testing/model/dependency.rb"

RUN make save_dependencies
