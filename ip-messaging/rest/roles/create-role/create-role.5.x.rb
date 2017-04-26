require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create role
service = @client.ip_messaging.v1.services('SERVICE_SID')
options = {
  FriendlyName: 'friendlyName',
  Type: 'deployment',
  Permission: 'createChannel',
  Permission: 'joinChannel'
}
role = service.roles(options)
puts role
