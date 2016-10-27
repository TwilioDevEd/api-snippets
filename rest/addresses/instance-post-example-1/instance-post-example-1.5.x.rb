# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new account_sid, auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@address = @client.account.addresses('AD2a0747eba6abf96b7e3c3ff0b4530f6e').fetch

# Update the customer name and street address
@address.update(customer_name: 'Customer 456',
                street: '2 Hasselhoff Lane')

# Print the updated customer name
puts @address.customer_name
