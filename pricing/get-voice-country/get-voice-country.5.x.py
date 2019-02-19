# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioPricingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioPricingClient(account_sid, auth_token)

country = client.voice.countries.get("EE")

for p in country.inbound_call_prices:
    print("{} {}".format(p['number_type'], p['current_price']))
