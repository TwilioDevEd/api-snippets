# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

ip_access_control_list_mapping = client.sip \
    .domains("SD32a3c49700934481addd5ce1659f04d2") \
    .ip_access_control_list_mappings \
    .create("AL95a47094615fe05b7c17e62a7877836c")

print(ip_access_control_list_mapping.sid)
