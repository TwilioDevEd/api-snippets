# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.lookups import TwilioLookupsClient

try:
    # Python 3
    from urllib.parse import quote
except ImportError:
    # Python 2
    from urllib import quote

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioLookupsClient(account_sid, auth_token)

encoded_number = quote('(510) 867-5310')
number = client.phone_numbers.get(
    encoded_number, include_carrier_info=True, country_code="US"
)
print(number.carrier['type'])
print(number.carrier['name'])
