require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

@client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete the service
service = @client.chat.v2.services(service_sid)
response = service.delete
puts response
