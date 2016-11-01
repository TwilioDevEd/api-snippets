require 'http'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the service
service = @client.ip_messaging.v1.services('SERVICE_SID')
response = service.update(default_service_role_sid: 'NEW_SID')
puts response
