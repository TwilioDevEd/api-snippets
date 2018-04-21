# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over members and print out a property for each one
members = client.account
                .queues.get('QU5ef8732a3c49700934481addd5ce1659')
                .members.list
members.each do |member|
  puts member.position
end
