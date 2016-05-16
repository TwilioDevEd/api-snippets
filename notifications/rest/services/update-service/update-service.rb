# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'

# Provide a SID for an existing notification service
service = client.notifications.v1.services('ISxxx')
response = service.update(friendly_name: 'NewFlowHipSlackChatDock')
puts response