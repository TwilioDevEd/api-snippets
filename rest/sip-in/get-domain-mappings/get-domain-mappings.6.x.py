# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# A list of ip_access_control_list_mapping objects with
# the properties described above
ip_access_control_list_mappings = client.sip \
    .domains("SD32a3c49700934481addd5ce1659f04d2") \
    .ip_access_control_list_mappings \
    .list()

# Loop over the list of ip_access_control_list_mappings and print
# a property for each one
for ip_access_control_list_mapping in ip_access_control_list_mappings:
    print(ip_access_control_list_mapping.friendly_name)
