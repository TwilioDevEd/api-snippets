# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@call = @client.api.calls('CAe1644a7eed5088b159577c5802d8be38').fetch

@call.update(
  url: 'http://demo.twilio.com/docs/voice.xml',
  method: 'POST'
)

puts @call.to
