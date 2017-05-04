require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)
service = @client.chat.v2.services(service_sid)

# Update a role
role = service.roles('ROLE_SID').update(permission: ['sendMessage', 'leaveChannel'])
puts "Role #{role.sid} now has permissions #{role.permissions.join(', ')}"
