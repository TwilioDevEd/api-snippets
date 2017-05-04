# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = TwilioIpMessagingClient(account, token)

credential = client.credentials.update(
    "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "gcm",
    api_key="xxxxx",
    friendly_name="my credential"
)

print(credential.friendly_name)
