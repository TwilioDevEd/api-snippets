# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

ip_address = client.sip \
    .ip_access_control_lists("AL32a3c49700934481addd5ce1659f04d2") \
    .ip_addresses \
    .create("My office IP Address", "55.102.123.124")

print(ip_address.sid)
