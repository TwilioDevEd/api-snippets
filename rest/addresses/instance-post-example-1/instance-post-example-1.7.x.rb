# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@address = @client.api.addresses('AD2a0747eba6abf96b7e3c3ff0b4530f6e').fetch

@address.update(
  customer_name: 'Customer 456',
  street: '2 Hasselhoff Lane'
)

puts @address.customer_name
