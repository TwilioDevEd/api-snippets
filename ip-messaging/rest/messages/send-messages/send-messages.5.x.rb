require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Send the messages
service = ip_messaging_client.services.get('SERVICE_SID')
channel = service.channels.get('CHANNEL_SID')
response = channel.messages.create(body: 'MESSAGE')
puts response
