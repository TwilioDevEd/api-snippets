# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@feedback = @client.calls.get('CAe03b7cd806070d1f32bdb7f1046a41c0')
                   .feedback
                   .create(quality_score: '3', issue: 'imperfect-audio')

puts @feedback.date_created
