# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token)

service = client.services.get(sid="ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
channel = service.channels.get(sid="CHANNEL_SID")
message = channel.messages.get(sid="MESSAGE_SID")
response = message.update(body="New message text")
print(response)
