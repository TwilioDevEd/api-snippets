# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of ip_address objects with the properties described above
ip_addresses = client.sip \
        .ip_access_control_lists("AL32a3c49700934481addd5ce1659f04d2") \
        .ip_addresses \
        .list()

for ip_address in ip_addresses:
    print(ip_address.friendly_name)
