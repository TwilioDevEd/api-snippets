# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

address = client.addresses.create(
    customer_name='Customer 500',
    street='Elm Street',
    city='Racoon',
    region='Mordor',
    postal_code='150',
    iso_country='AX'
)

print(address.customer_name)
