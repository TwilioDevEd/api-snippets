# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new(account_sid, auth_token)

# Provide a SID for an existing notification service
service = client.notify.v1.services('ISxxx')

response = service.update(friendly_name: 'NewFlowHipSlackChatDock')

puts response
