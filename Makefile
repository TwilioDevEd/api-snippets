.PHONY: start, start_dev, register_hosts, run_api_faker, install_dependencies, save_dependencies, restore_dependencies

define HOSTS
127.0.0.1 api.twilio.com
127.0.0.1 chat.twilio.com
127.0.0.1 fax.twilio.com
127.0.0.1 ip-messaging.twilio.com
127.0.0.1 lookups.twilio.com
127.0.0.1 messaging.twilio.com
127.0.0.1 monitor.twilio.com
127.0.0.1 notifications.twilio.com
127.0.0.1 notify.twilio.com
127.0.0.1 preview.twilio.com
127.0.0.1 pricing.twilio.com
127.0.0.1 sync.twilio.com
127.0.0.1 taskrouter.twilio.com
127.0.0.1 video.twilio.com
127.0.0.1 wireless.twilio.com
endef

export HOSTS

define register_hosts
	printf "$$HOSTS" >> /etc/hosts;
endef

define run_api_faker
	cd /twilio-api-faker && \
	java -jar ./build/libs/twilio-api-faker.jar > twilio-api-faker.txt &
	cd /src
	sleep 5
endef

define install_dependencies
	ruby tools/snippet-testing/model/dependency.rb
	$(call append_certs, save_dependencies)
endef

define save_dependencies
	cp -r /src/tools/dependencies /dependencies
endef

define restore_dependencies
	cp -r /dependencies /src/tools
endef


define files_changed_by_ext
  FILES=$(shell git diff --cached --name-only -- '*.$(1)'); \
	FILES=$(shell git diff --name-only -- '*.$(1)'); \
	echo $$FILES
endef

define install_git_hooks
	rm -f .git/hooks/pre-commit
	echo '#!/bin/sh\n\n./lint' >> .git/hooks/pre-commit
endef

define enabled_docker_experimental_features
	cp ./daemon.json /etc/docker/daemon.json
endef

FAKE_CERT = /usr/local/share/ca-certificates/twilio_fake.crt

append_certs:
	find /.virtualenvs/ -name '*cacert.pem' | while read line; do \
		cat $(FAKE_CERT) >> $$line; \
	done

run_docker_dev:
	@docker build . -t twiliodeved/api-snippets --no-cache
	@docker run -it -v $$PWD:/src twiliodeved/api-snippets bash -c "make start; bash --login"

start:
	@$(call register_hosts)
	@$(call restore_dependencies)
	@$(call run_api_faker)
	@npm i --quiet

run_tests:
	ruby tools/snippet-testing/snippet_tester.rb

install_api_faker:
		rm -rf /twilio-api-faker \
	  && git clone https://github.com/TwilioDevEd/twilio-api-faker.git --depth 1 /twilio-api-faker \
	  && cp /twilio-api-faker/keystore/twilio_fake.pem /usr/local/share/ca-certificates/twilio_fake.crt \
	  && update-ca-certificates \
	  && cd /twilio-api-faker && gradle jar && cd /api-snippets-base

install:
	@docker pull twiliodeved/api-snippets-base:latest \
	&& docker build . -t twiliodeved/api-snippets --no-cache
	@$(call install_git_hooks)


install_in_travis:
	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
	&& sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable" \
	&& sudo apt-get update \
	&& apt-cache policy docker-ce \
	&& sudo apt-get install -y docker-ce \
	&& $(call enabled_docker_experimental_features) \
	&& sudo service docker restart \
	&& sleep 10
