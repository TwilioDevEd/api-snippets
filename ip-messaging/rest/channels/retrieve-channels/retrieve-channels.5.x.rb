require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve a particular channel
my_channel_sid = 'CHANNEL_SID'
service = @client.chat.v2.services(service_sid)
channel = service.channels(my_channel_sid).fetch
puts "Channel #{channel.sid} has Unique Name \"#{channel.unique_name}\""
