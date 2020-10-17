# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

ip_access_control_lists = client.sip \
    .ip_access_control_lists \
    .list()

# Loop over the list of ip_access_control_lists and print
# a property for each one
for ip_access_control_list in ip_access_control_lists:
    print(ip_access_control_list.friendly_name)
