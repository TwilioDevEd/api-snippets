require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the credential
response = client.chat
                 .v2.credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 .fetch.update(friendly_name: 'friendly_name')
puts response
