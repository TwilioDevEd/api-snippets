# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
client = Twilio::REST::Client.new account_sid, auth_token

# Retrieve a valid notification service
service = client.notifications.v1.services('ISxxx')

response = service.bindings('Bxxx').delete

puts response
