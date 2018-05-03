# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Find your Account Sid at https://www.twilio.com/console/account/settings
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
# Create an API Key and Secret at
# https://www.twilio.com/console/chat/dev-tools/api-keys
api_key = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_secret = 'your_api_secret'
# Your Chat Service SID from https://www.twilio.com/console/chat/services
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

# Authenticate with Twilio
client = Client(api_key, api_secret, account_sid)

# Update the service webhooks
template = 'A New message in ${CHANNEL} from ${USER}: ${MESSAGE}'
service = client.chat \
                .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .update(
                    notifications_added_to_channel_enabled=True,
                    notifications_added_to_channel_template=template,
                    notifications_added_to_channel_sound='default')

print(service.sid)
