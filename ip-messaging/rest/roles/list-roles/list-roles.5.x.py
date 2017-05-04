# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the Client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = TwilioIpMessagingClient(account, token)

# List the role
service = client.services.get(sid="ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
for c in service.roles.list():
    print(c.sid)
