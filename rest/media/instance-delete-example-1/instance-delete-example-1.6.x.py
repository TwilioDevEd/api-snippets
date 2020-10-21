# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

client.messages("MM800f449d0399ed014aae2bcc0cc2f2ec") \
      .media("ME557ce644e5ab84fa21cc21112e22c485") \
      .delete()
