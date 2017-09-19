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
endef

export HOSTS

define register_hosts
	printf "$$HOSTS" >> /etc/hosts;
endef

define run_api_faker
	cd /twilio-api-faker
	gradle run </dev/null &>/dev/null &
	cd /src
	sleep 25
endef

define install_dependencies
	ruby tools/snippet-testing/model/dependency.rb
	$(call append_certs, save_dependencies)
endef

define save_dependencies
	cp -r /src/tools/dependencies /dependencies
endef

define restore_dependencies
	cp -r /dependencies /src/tools/dependencies
endef

FAKE_CERT = /usr/local/share/ca-certificates/twilio_fake.crt

define append_certs
	find /.virtualenvs/ -name '*cacert.pem' | while read line; do \
		cat $(FAKE_CERT) >> $$line; \
	done
endef

run_docker_dev:
	docker run -it -v $$PWD:/src api-snippets bash -c "make start_dev; bash --login"

build_base:
	docker build . -f Dockerfile-base -t twiliodeved/api-snippets:base
	docker push twiliodeved/api-snippets:base

start:
	$(call register_hosts)
	$(call restore_dependencies)
	$(call run_api_faker)

run_tests:
	ruby tools/snippet-testing/snippet_tester.rb
