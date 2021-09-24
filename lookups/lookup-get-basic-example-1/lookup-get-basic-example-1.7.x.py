# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)


try:
    number = client.lookups.phone_numbers("+15108675310").fetch(type="carrier")

    print(number.carrier['type'])
    print(number.carrier['name'])
except TwilioRestException as error:
    if error.status == 404:
        print('No carrier information')
    else:
        raise error
