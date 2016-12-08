require 'http'
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve role
service = @client.ip_messaging.v1.services('SERVICE_SID')
role = service.roles('ROLES_SID')
puts role
