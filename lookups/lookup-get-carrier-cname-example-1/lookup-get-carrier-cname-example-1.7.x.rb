# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

encoded_phone_number = CGI.escape('+15108675310')
number = @client.lookups.v1
                .phone_numbers(encoded_phone_number)
                .fetch(type: ['carrier', 'caller-name'])

puts number.carrier['type']
puts number.carrier['name']
