
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Update the message
service = ip_messaging_client.services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
channel = service.channels.get('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
message = channel.messages.get('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
response = message.delete()
puts response
