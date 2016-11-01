require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the message
service = @client.ip_messaging.v1.services('SERVICE_SID')
channel = service.channels('CHANNEL_SID')
message = channel.messages('MESSAGE_SID')
response = message.delete
puts response
