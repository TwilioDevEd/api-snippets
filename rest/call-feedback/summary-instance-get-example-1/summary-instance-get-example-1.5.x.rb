# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@summary = @client.account.calls
                  .feedback_summaries('FSa346467ca321c71dbd5e12f627deb854')
                  .fetch

# Print date created for feedback summary
puts @summary.date_created
