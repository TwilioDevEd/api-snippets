# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.account.messages.create(
  body: "Let's grab lunch at Milliways tomorrow!",
  to: '+15558675310',
  from: '+14158141829',
  media_url: 'http://www.example.com/cheeseburger.png'
)
puts message.to
