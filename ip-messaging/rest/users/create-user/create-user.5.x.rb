require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID
# from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the user
user = client.chat.v2.services(service_sid)
             .users.create(identity: 'IDENTITY')
puts user
