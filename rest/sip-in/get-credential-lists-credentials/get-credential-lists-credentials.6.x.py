# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

credentials = client.sip \
    .credential_lists("CL32a3c49700934481addd5ce1659f04d2") \
    .credentials \
    .list()

# Loop over the list of credentials and print(a property for each one
for credential in credentials:
    print(credential.username)
