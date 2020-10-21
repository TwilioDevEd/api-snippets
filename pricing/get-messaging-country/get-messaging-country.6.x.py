# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account_sid, auth_token)

country = client.pricing \
                .messaging \
                .countries("EE") \
                .fetch()

for inbound_sms_price in country.inbound_sms_prices:
    number_type = inbound_sms_price['number_type']
    current_price = inbound_sms_price['current_price']
    print("{} {}".format(number_type, current_price))
