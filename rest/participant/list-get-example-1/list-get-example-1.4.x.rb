# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over participants and print out a property for each one
participants = client.account
                     .conferences.get('CFbbe4632a3c49700934481addd5ce1659')
                     .participants.list
participants.each do |participant|
  puts participant.muted
end
