# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACCOUNT_SID"
auth_token = "your_auth_token"
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
