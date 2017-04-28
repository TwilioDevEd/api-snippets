require 'http'
require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID from twilio.com/console
account_sid = '<ACCOUNT_SID>'
auth_token = '<AUTH_TOKEN>'
service_sid = '<SERVICE_SID>'
channel_sid = '<CHANNEL_SID>'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# List the messages
service = @client.ip_messaging.v2.services(service_sid)
channel = service.channels(channel_sid) 

channel.messages.each do |message|
    puts "#{message.sid} #{message.body}"
end
