# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@call = @client.calls.create(
  url: 'http://demo.twilio.com/docs/voice.xml',
  to: 'client:tommy',
  from: '+15017250604'
)

puts @call.start_time
