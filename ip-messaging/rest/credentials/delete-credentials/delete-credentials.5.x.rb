require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete the credential
response = client.chat.v2
                 .credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 .fetch.delete
puts response
