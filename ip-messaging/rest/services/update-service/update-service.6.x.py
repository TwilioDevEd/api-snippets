# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

service = client.chat.services("SERVICE_SID").update(
    friendly_name="NEW_FRIENDLY_NAME"
)

print(service.friendly_name)
