# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

@summary = @client.account.calls.feedback_summary
                  .create(
                    start_date: '2014-06-01',
                    end_date: '2014-06-30',
                    include_subaccounts: 'true'
                  )

puts @summary.status, @summary.sid
