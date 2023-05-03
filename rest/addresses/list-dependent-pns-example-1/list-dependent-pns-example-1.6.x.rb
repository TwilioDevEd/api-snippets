# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get address by sid
@address = @client.api.addresses('AD2a0747eba6abf96b7e3c3ff0b4530f6e').fetch

# Print friendly_name for each phone number
@address.dependent_phone_numbers.list.each do |number|
  puts number.friendly_name
end
