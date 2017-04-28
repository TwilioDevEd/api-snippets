require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
service_sid = 'SERVICE_SID'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# List the channels
service = @client.chat.v2.services(service_sid)
channels = service.channels.each do |c|
    puts "#{c.sid} \"#{c.unique_name}\""
end
