# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

new_sub_account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
number_sid = "PN2a0747eba6abf96b7e3c3ff0b4530f6e"

number = client.incoming_phone_numbers(number_sid).update(
    account_sid=new_sub_account
)

print(number.phone_number)
