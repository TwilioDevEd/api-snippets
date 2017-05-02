# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

credential = client.chat.credentials.create("gcm", friendly_name="Friendly Name", api_key="apiKey")

print(credential)
