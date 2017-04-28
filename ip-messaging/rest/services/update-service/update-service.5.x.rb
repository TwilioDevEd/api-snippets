require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
service_sid = 'SERVICE_SID'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the service with something new.
new_role_sid = 'RLxx'
service = @client.ip_messaging.v2.services(service_sid)
response = service.update(default_service_role_sid: new_role_sid)
puts "Updated role sid to #{response.new_role_sid}!"
