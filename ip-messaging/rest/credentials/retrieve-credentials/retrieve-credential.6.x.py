# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

credential = client.ip_messaging.credentials("CREDENTIAL_SID").fetch()

print(credential.sid)
