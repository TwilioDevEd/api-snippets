# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

credential = client.chat \
    .credentials("CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .update(friendly_name="MyCredential", api_key=os.environ['TWILIO_API_KEY_SECRET'])

print(credential.friendly_name)
