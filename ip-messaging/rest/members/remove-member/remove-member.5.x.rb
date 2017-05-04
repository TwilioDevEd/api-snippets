require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'AUTH_TOKEN'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
channel_sid = 'CHANNEL_SID'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Remove the member
service = @client.chat.v2.services(service_sid)
channel = service.channels(channel_sid)

response = channel.members('MEMBER_SID').delete
puts response
