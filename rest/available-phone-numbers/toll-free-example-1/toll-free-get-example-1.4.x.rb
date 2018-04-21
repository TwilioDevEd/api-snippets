# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

@numbers = @client.account.available_phone_numbers.get('US').toll_free.list

# Purchase the number
@number = @numbers[0].phone_number
@client.account.incoming_phone_numbers.create(phone_number: @number)
