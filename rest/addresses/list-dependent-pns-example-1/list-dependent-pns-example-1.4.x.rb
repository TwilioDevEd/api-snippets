# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over addresses and print out a property for each one
@address = @client.account.addresses.get('AD2a0747eba6abf96b7e3c3ff0b4530f6e')
@address.dependent_phone_numbers.list.each do |number|
  puts number.friendly_name
end
