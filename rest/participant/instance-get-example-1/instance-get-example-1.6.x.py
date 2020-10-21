# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

participant = client.conferences('CFbbe4632a3c49700934481addd5ce1659') \
                    .participants("CA386025c9bf5d6052a1d1ea42b4d16662") \
                    .fetch()

print(participant.start_conference_on_enter)
