# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token)

# Update the channel
service = client.services.get(sid="CHANNEL_SID")
channel = service.channels.create()
response = channel.update(friendly_name="NEW_FRIENDLY_NAME")
print(response)
