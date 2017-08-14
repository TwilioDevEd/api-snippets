require 'twilio-ruby'

# Get your Account SID, Auth Token, Service SID and Channel SID from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# List the users
service = @client.chat.v2.services(service_sid)
service.users.each do |user|
  puts "#{user.sid} #{user.identity}"
end
