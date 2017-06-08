
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Send the messages
service = ip_messaging_client.services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
channel = service.channels.get('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
response = channel.messages.create(body: 'MESSAGE')
puts response
