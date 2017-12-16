# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# In the case you want to transfer numbers between subaccounts, you need to
# know three things - the account SID of the phone number's current owner,
# the account SID of the account you'd like to transfer the number to, and
# the SID of the phone number you'd like to transfer
current_owner_sid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
new_owner_sid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
number_sid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"

number = client.api.accounts(current_owner_sid) \
               .incoming_phone_numbers(number_sid) \
               .update(account_sid=new_owner_sid)

print(number.phone_number)
