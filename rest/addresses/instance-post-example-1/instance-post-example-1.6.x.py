# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

address = client.addresses("AD2a0747eba6abf96b7e3c3ff0b4530f6e") \
                .update(customer_name="Customer 456",
                        street="2 Hasselhoff Lane")

print(address.customer_name)
