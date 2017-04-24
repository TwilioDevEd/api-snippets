# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
apn_credential_sid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
fcm_credential_sid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(
    account, apn_credential_sid, fcm_credential_sid, token
)

service = client.notify.services.create(friendly_name="My Awesome Service")

print(service.friendly_name)
