# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::LookupsClient.new account_sid, auth_token

number = @client.phone_numbers.get('(510) 867-5310', country_code: 'US')

puts number.phone_number
