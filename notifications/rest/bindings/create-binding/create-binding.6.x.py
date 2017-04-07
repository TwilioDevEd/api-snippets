# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

binding = client.notify.services("ISxxx").bindings.create(
    endpoint="endpoint_id",
    identity="00000001",
    binding_type="gcm",
    address="device_token",
    tag="premium"
)

print(binding.sid)
