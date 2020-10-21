# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

number = client.lookups.phone_numbers("+16502530000").fetch(
    type="caller-name",
)

print(number.caller_name['caller_type'])
print(number.caller_name['caller_name'])
