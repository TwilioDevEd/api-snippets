require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Update the channel
service = ip_messaging_client.services.get('SERVICE_SID')
channel = service.channels.create()
channel_updated = channel.update(unique_name: 'NEW_SID')
puts channel_updated
