require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.ip_messaging.v2.services.each do |s|
    puts "#{s.sid} #{s.friendly_name}"
end
