# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Use the Account Sid and Auth Token of the subaccount which currently
# owns the number you want to transfer (twilio.com/console/account/subaccounts)
account_sid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

# In the case you want to transfer numbers between subaccounts, you need to
# know two things: the account SID of the account you'd like to transfer the
# number to, and the SID of the phone number you'd like to transfer
new_owner_sid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
number_sid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"

number = client.phone_numbers.update(number_sid, account_sid=new_owner_sid)
print(number.phone_number)
