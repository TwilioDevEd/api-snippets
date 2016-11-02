require 'http'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Send the messages
service = @client.ip_messaging.v1.services('SERVICE_SID')
channel = service.channels('CHANNEL_SID')
response = channel.messages(body: 'MESSAGE')
puts response
