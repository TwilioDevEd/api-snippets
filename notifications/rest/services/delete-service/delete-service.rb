# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{twilio account sid}'
auth_token = '{twilio auth token}'

# Provide the SID for an existing service
service = client.notifications.v1.services('ISxxx')
response = service.delete()
puts response