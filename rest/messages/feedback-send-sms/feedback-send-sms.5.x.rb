# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# create a message with additional provide_feedback attribute
@client.account.messages.create(
  from: '+15017250604',
  to: '+15558675309',
  body: 'Open to confirm: http://yourserver.com/confirm?id=1234567890',
  provide_feedback: true
)
