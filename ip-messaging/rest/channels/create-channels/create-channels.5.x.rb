require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the channel
service = @client.chat.v2.services(service_sid)
channel = service.channels.create(unique_name: "My new channel")
puts "Channel #{channel.sid} (\"#{channel.unique_name}\") created!"
