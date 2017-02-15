# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

country = client.pricing \
                .messaging \
                .countries("EE") \
                .fetch()

for inbound_sms_price in country.inbound_sms_prices:
    print("{} {}".format(inbound_sms_price['number_type'],
                         inbound_sms_price['current_price']))
