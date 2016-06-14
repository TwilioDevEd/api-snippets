# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)
old_account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
new_account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
number_sid = "PN2a0747eba6abf96b7e3c3ff0b4530f6e"

subaccount = client.accounts.get(old_account)
number = subaccount.phone_numbers.update(number_sid, account_sid=new_account)
print(number.phone_number)
