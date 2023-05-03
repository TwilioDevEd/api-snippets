# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@phone_number = @client.messaging.v1
                       .services('MG2172dd2db502e20dd981ef0d67850e1a')
                       .phone_numbers('PN557ce644e5ab84fa21cc21112e22c485')
                       .fetch

puts @phone_number.phone_number
