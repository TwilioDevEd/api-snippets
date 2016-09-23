# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of caller_id objects with the properties described above
caller_ids = client.outgoing_caller_ids \
                   .list(phone_number="+14158675309")

for caller_id in caller_ids:
    print(caller_id.phone_number)
