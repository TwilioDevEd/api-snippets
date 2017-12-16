require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)
service = @client.chat.v2.services(service_sid)

# Create role
role = service.roles.create(
  friendly_name: 'friendlyName',
  type: 'deployment',
  permission: %w[createChannel joinChannel]
)

puts "Created role #{role.sid}."
