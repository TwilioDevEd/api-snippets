# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Account Sid and Auth token for your new subaccount
sub_account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
sub_auth_token = 'your_auth_token'
@sub_account_client = Twilio::REST::Client.new(sub_account_sid, sub_auth_token)

# Make a call from your subaccount
@sub_account_client.account.calls.create(
  from: '+14158141829',
  to:   '+16518675310',
  url:  'http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount'
)
