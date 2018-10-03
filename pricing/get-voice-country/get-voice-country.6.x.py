# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

country = client.pricing.v2 \
                .voice \
                .countries("EE") \
                .fetch()

for p in country.inbound_call_prices:
    print("{} {}".format(p['number_type'], p['current_price']))
