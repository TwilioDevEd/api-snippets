# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

@call = @accounts.calls.create(
  url: 'http://www.example.com/sipdial.xml',
  to: 'sip:kate@example.com?hatchkey=4815162342',
  from: 'Jack'
)

# Print the call direction
puts @call.direction
