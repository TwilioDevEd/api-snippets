# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a new address
@address = @client.account.addresses.create(
  friendly_name: 'Billing - Customer 123',
  customer_name: 'Customer 123',
  street: '1 Hasselhoff Lane',
  city: 'Berlin',
  region: 'Berlin',
  postal_code: '10875',
  iso_country: 'DE'
)

# print address sid
puts @address.sid
