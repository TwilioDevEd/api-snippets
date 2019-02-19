require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the service with something new.
new_role_sid = 'RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
service = @client.chat.v2.services(service_sid)
response = service.update(default_service_role_sid: new_role_sid)
puts "Updated role sid to #{response.default_service_role_sid}!"
