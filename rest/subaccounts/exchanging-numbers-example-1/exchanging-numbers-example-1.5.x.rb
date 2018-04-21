# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# In the case you want to transfer numbers between subaccounts, you need to
# know three things - the account SID of the phone number's current owner,
# the account SID of the account you'd like to transfer the number to, and
# the SID of the phone number you'd like to transfer
current_owner_sid = 'ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
new_owner_sid = 'ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
phone_number_sid = 'PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# Update the number
number = client.api.v2010.accounts(current_owner_sid)
               .incoming_phone_numbers(phone_number_sid)
               .fetch
number.update(account_sid: new_owner_sid)
puts number.phone_number
