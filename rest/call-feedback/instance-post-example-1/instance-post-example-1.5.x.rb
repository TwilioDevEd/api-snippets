# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Create feedback for call with given sid
@feedback = @accounts.calls('CAe03b7cd806070d1f32bdb7f1046a41c0')
                     .feedback.create(
                       quality_score: '3',
                       issue: 'imperfect-audio'
                     )

# Print date on which feedback was created
puts @feedback.date_created
