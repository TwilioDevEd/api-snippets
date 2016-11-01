require 'http'
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the member
service = @client.ip_messaging.v1.services('SERVICE_SID').fetch
channel = service.channels('CHANNEL_SID').fetch
member = channel.members('MEMBER_SID').fetch
puts member
