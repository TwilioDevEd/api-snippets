# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'AC00000000000000000000000000000001'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

incoming_phone_number = client \
    .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .update(account_sid='AC00000000000000000000000000000002')

print(incoming_phone_number.friendly_name)
