# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
apn_credential_sid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
fcm_credential_sid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

service = client.notify.services.create(
    friendly_name="My Awesome Service",
    apn_credential_sid=apn_credential_sid,
    fcm_credential_sid=fcm_credential_sid
)

print(service.friendly_name)
