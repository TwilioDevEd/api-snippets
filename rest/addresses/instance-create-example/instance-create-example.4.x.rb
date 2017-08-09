# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
address = client.account.addresses.create(
  customer_name: 'Customer 500',
  street: 'Elm Street',
  city: 'Racoon',
  region: 'Mordor',
  postal_code: '150',
  iso_country: 'AX')

puts address.customer_name
