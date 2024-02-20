# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
recording_sid = "RE557ce644e5ab84fa21cc21112e22c485"

client = Client(account_sid, auth_token)

client.api.v2010.accounts(sid=account_sid).recordings(sid=recording_sid
                                                      ).fetch()
