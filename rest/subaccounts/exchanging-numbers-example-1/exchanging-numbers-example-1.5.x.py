# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

# In the case you want to transfer numbers between subaccounts, you need to 
# know three things - the account SID of the phone number's current owner, 
# the account SID of the account you'd like to transfer the number to, and 
# the SID of the phone number you'd like to transfer
current_owner_sid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
new_owner_sid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
number_sid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"

number = client.phone_numbers.update(number_sid, account_sid=new_owner_sid)
print(number.phone_number)