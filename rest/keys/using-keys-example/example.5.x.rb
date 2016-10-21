# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_secret = 'your_api_secret'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(api_key, api_secret, account_sid)

# Create a message
@message = @client.messages.create(
  to: '+15558675309',
  from: '+15017250604',
  body: 'Hello World!'
)

# Print the new message sid
puts @message.sid
