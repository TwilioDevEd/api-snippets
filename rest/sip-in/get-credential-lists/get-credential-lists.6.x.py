# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of credential_list objects with the properties described above
credential_lists = client.sip \
                         .credential_lists \
                         .list()

for credential_list in credential_lists:
    print(credential_list.friendly_name)
