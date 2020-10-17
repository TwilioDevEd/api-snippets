# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
sub_account_sid = os.environ['TWILIO_SUBACCOUNT_SID']
client = Client(account_sid, auth_token)

incoming_phone_number = client \
    .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .update(account_sid=sub_account_sid)

print(incoming_phone_number.friendly_name)
