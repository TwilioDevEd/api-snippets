# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
credential = client.sip \
        .credential_lists("CL32a3c49700934481addd5ce1659f04d2") \
        .credentials("SC32a3c49700934481addd5ce1659f04d2") \
        .update(password="other_password")

print(credential.username)
