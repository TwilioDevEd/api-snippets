require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Remove the member
service = @client.ip_messaging.v1.services('SERVICE_SID')
channel = service.channels('CHANNEL_SID')
response = channel.members('MEMBER_SID').delete
puts response
