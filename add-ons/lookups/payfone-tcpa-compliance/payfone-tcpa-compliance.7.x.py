# Download the Python helper library from twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

add_ons_data = {"payfone_tcpa_compliance.RightPartyContactedDate": "20160101"}

number = client.lookups \
    .phone_numbers("+16502530000") \
    .fetch(add_ons="payfone_tcpa_compliance", add_ons_data=add_ons_data)

print(number.add_ons)
