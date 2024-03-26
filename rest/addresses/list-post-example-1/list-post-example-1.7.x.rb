# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@address = @client.addresses.create(
  friendly_name: 'Billing - Customer 123',
  customer_name: 'Customer 123',
  street: '1 Hasselhoff Lane',
  city: 'Berlin',
  region: 'Berlin',
  postal_code: '10875',
  iso_country: 'DE'
)

puts @address.sid
