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

start:
	make register_hosts
	make run_api_faker

start_dev:
	make register_hosts
	make restore_dependencies
	make run_api_faker

register_hosts:
	printf "$$HOSTS" >> /etc/hosts;

run_api_faker:
	cd ../twilio-api-faker;\
	gradle run </dev/null &>/dev/null &
	cd ../src
	sleep 25

install_dependencies:
	ruby tools/snippet-testing/model/dependency.rb && \
	make append_certs && \
	make save_dependencies

save_dependencies:
	cp -r tools/dependencies /dependencies

restore_dependencies:
	cp -r /dependencies tools/dependencies

run_tests:
	ruby tools/snippet-testing/snippet_tester.rb

run_docker_dev:
	docker run -it -v $$PWD:/src api-snippets bash -c "make start_dev; bash --login"

FAKE_CERT = /usr/local/share/ca-certificates/twilio_fake.crt

append_certs:
	find /.virtualenvs/ -name '*cacert.pem' | while read line; do \
		cat $(FAKE_CERT) >> $$line; \
	done
