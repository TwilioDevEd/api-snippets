require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the channel
service = @client.ip_messaging.v1.services('SERVICE_SID')
channel = service.channels.create
channel_updated = channel.update(unique_name: 'NEW_SID')
puts channel_updated
