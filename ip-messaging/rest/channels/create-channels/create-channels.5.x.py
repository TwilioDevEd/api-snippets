# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token)

# Create the channel
service = client.services.get(sid="SERVICE_SID")
channel = service.channels.create()
print(channel.sid)
