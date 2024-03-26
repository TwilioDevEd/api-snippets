# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@phone_numbers = @client.messaging.v1
                        .services('MG2172dd2db502e20dd981ef0d67850e1a')
                        .phone_numbers.list

@phone_numbers.each do |phone_number|
  puts phone_number.phone_number
end
