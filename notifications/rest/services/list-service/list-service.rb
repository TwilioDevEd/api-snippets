# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{twilio account sid}'
auth_token = '{twilio auth token}'

services = client.notifications.v1.services.list(:limit => 100)

puts services