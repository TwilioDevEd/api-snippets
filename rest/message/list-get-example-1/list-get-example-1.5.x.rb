# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get message with the given sid
@message = @client.api.messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch

@client.messages.list.each do |message|
  puts message.body
end
