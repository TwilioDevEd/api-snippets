# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Get call with given sid
@call = @accounts.calls('CAe1644a7eed5088b159577c5802d8be38').fetch

# Update call properties
@call.update(
  url: 'http://demo.twilio.com/docs/voice.xml',
  method: 'POST'
)

# Print call recipient
puts @call.to
