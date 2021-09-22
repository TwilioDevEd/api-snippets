# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

client.sip \
    .credential_lists("CL32a3c49700934481addd5ce1659f04d2") \
    .credentials("SC32a3c49700934481addd5ce1659f04d2") \
    .delete()
