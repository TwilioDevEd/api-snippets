# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

# Update the channel
channel = client.chat \
                .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .channels("CHANNEL_SID") \
                .update(friendly_name="NEW_FRIENDLY_NAME")

print(channel.friendly_name)
