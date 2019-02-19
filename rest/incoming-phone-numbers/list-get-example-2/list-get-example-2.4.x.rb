# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over numbers and print out a property for each one
numbers = client.account
                .incoming_phone_numbers.list(phone_number: '+12349013030')
numbers.each do |number|
  puts number.phone_number
end
