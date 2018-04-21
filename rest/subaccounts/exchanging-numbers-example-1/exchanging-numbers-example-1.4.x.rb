# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# In the case you want to transfer numbers between subaccounts, you need to
# know three things - the account SID of the phone number's current owner,
# the account SID of the account you'd like to transfer the number to, and
# the SID of the phone number you'd like to transfer
current_owner_sid = 'ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
new_owner_sid = 'ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
phone_number_sid = 'PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# Update the number
@subaccount = @client.accounts.get(current_owner_sid)
@number = @subaccount.incoming_phone_numbers.get(phone_number_sid)
@number.update(account_sid: new_owner_sid)
puts @number.phone_number
