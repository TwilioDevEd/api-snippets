# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@short_code = @client.messaging.v1
  .services('MG2172dd2db502e20dd981ef0d67850e1a')
  .short_codes('SC3f94c94562ac88dccf16f8859a1a8b25')
  .fetch

puts @short_code.url
