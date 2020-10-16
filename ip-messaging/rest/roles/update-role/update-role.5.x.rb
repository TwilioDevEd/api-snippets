require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
client = Twilio::REST::Client.new(account_sid, auth_token)
service = client.chat.v2.services(service_sid)

# Update a role
role = service.roles('RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch
new_permissions = role.permissions | ['sendMediaMessage']
role = role.update(permission: new_permissions)
puts "Role #{role.sid} now has permissions #{role.permissions.join(', ')}"
