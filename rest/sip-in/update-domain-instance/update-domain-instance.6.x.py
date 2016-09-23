# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
domain = client.sip \
        .domains("SD27f0288630a668bdfbf177f8e22f5ccc") \
        .update(friendly_name="Little Kevin", voice_method="GET")

print(domain.domain_name)
