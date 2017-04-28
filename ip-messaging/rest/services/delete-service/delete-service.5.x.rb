require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
service_sid = 'SERVICE_SID'

@client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete the service
service = @client.ip_messaging.v2.services(service_sid)
response = service.delete
puts response
