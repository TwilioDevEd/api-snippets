# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over messages and print out a property for each one
@client.account.messages.list(to: 'to_number',
                              from: 'from_number',
                              date: '2015-04-01T00:00:00Z').each do |message|
  puts message.body
end
