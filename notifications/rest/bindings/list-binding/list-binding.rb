# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
client = Twilio::REST::Client.new account_sid, auth_token

# Retrieve a valid notification service
service = client.notifications.v1.services('ISxxx')

start_date = Date.parse('2015-08-25')
bindings = service.bindings.list(tag: 'new user', start_date: start_date)

puts bindings
