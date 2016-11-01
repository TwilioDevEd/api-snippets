require 'twilio-ruby'

#initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

#Delete the channel
service = ip_messaging_client.services.get('SERVICE_SID')
channel = service.channels.create()
response = channel.delete()
puts response