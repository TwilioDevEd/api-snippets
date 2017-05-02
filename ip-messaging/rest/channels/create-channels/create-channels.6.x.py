# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

# Create the channel
channel = client.chat \
                .services("SERVICE_SID") \
                .channels \
                .create(friendly_name="MyChannel")

print(channel.sid)
