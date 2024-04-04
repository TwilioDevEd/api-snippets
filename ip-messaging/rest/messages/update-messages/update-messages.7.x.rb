require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID
# from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
channel_sid = 'CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
message_sid = 'IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the message
service = @client.chat.v2.services(service_sid)
channel = service.channels(channel_sid)
message = channel.messages(message_sid).fetch
message_updated = message.update(body: 'New message text')
puts "#{message_updated.sid} #{message_updated.body}"
