# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_secret = 'your_api_secret'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(api_key, api_secret, account_sid)

@message = @client.messages.create(
  to: '+15558675309',
  from: '+15017250604',
  body: 'Hello World!'
)

puts @message.sid
