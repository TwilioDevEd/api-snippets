# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.lookups import TwilioLookupsClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC3094732a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioLookupsClient(account_sid, auth_token)

number = client.phone_numbers.get("+15108675309", include_carrier_info=True)
print(number.carrier['type'])
print(number.carrier['name'])
