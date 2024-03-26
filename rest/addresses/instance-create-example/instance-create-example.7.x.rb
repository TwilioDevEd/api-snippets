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
@address = @client.api.addresses.create(
  customer_name: 'Customer 500',
  street: 'Elm Street',
  city: 'Racoon',
  region: 'Mordor',
  postal_code: '150',
  iso_country: 'AX'
)

puts @address.customer_name
