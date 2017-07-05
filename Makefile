.PHONY: start, start_dev, register_hosts, run_api_faker, install_dependencies, save_dependencies, restore_dependencies

define HOSTS
127.0.0.1 notifications.twilio.com
127.0.0.1 notify.twilio.com
127.0.0.1 notifications.twilio.com
127.0.0.1 taskrouter.twilio.com
127.0.0.1 api.twilio.com
127.0.0.1 lookups.twilio.com
127.0.0.1 pricing.twilio.com
127.0.0.1 monitor.twilio.com
127.0.0.1 fax.twilio.com
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
	ruby tools/snippet-testing/model/dependency.rb

save_dependencies:
	cp -r tools/dependencies /dependencies

restore_dependencies:
	cp -r /dependencies tools/dependencies
