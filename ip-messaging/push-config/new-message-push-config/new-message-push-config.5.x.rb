require 'twilio-ruby'

# Find your Account Sid at https://www.twilio.com/console/account/settings
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
# Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
api_key = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_secret = 'your_api_secret'
# Your Chat Service SID from https://www.twilio.com/console/chat/services
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
# Authenticate with Twilio
client = Twilio::REST::Client.new(api_key, api_secret, account_sid)

# Update the service webhooks
service = client.chat.v2.services(service_sid)
                .update(notifications_added_to_channel_enabled: true,
                        notifications_added_to_channel_template: 'A New ' \
                          'message in ${CHANNEL} from ${USER}: ${MESSAGE}',
                        notifications_added_to_channel_sound: 'default')

puts "Service: #{service}"
