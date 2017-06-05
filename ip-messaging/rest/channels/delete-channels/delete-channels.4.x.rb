require 'twilio-ruby'

#initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

#Delete the channel
service = ip_messaging_client.services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
channel = service.channels.create()
response = channel.delete()
puts response
