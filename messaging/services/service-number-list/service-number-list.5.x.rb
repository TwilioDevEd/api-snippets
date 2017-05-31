# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@phone_numbers = @client.messaging.v1
  .services('MG2172dd2db502e20dd981ef0d67850e1a')
  .phone_numbers.list

@phone_numbers.each do |phone_number|
  puts phone_number.phone_number
end
