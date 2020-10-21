require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.calls.create(
  url: 'http://www.example.com/sipdial.xml',
  to: 'sip:kate@example.com?hatchkey=4815162342',
  from: 'Jack'
)

puts call.direction
