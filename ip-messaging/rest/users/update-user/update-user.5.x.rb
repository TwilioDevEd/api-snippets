require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
service_sid = 'SERVICE_SID'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the user
service = @client.chat.v2.services(service_sid)
user = service.users('USER_SID').fetch
response = user.update(role_sid: 'NEW_SID')
puts response
