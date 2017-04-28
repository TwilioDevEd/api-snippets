require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
service_sid = 'SERVICE_SID'
@client = Twilio::REST::Client.new(account_sid, auth_token)
service = @client.chat.v2.services(service_sid)

# Create role
role = service.roles.create(
    friendly_name: 'friendlyName',
    type: 'deployment',
    permission: ['createChannel', 'joinChannel'])

puts "Created role #{role.sid}."
