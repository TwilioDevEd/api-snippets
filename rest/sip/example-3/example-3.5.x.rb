require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.account.calls.create(
  url: 'http://www.example.com/sipdial.xml',
  to: 'sip:kate@example.com?hatchkey=4815162342',
  from: 'Jack'
)

puts call.direction
