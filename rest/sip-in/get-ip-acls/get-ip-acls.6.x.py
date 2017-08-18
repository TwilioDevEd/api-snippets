# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of ip_access_control_list objects with the properties described above
ip_access_control_lists = client.sip \
    .ip_access_control_lists \
    .list()

# Loop over the list of ip_access_control_lists and print a
# property for each one
for ip_access_control_list in ip_access_control_lists:
    print(ip_access_control_list.friendly_name)
