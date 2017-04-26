require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the user
service = @client.ip_messaging.v1.services('SERVICE_SID')
user = service.users.create(identity: 'IDENTITY')
response = user.update(role_sid: 'NEW_SID')
puts response
