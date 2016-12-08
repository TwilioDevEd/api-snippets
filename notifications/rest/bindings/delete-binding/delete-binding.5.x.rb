# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new account_sid, auth_token

# Retrieve a valid notification service
service = client.notify.v1.services('ISxxx')

response = service.bindings('Bxxx').delete

puts response
