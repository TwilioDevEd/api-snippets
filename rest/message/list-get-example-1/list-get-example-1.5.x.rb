# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get message with the given sid
@message = @client.account.messages('MM800f449d0399ed014aae2bcc0cc2f2ec').fetch

# Loop over messages and print out a property for each one
@client.account.messages.list.each do |message|
  puts message.body
end
