# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Find all calls which are busy
@accounts.calls.list(
  status: 'busy',
  to: '+15558675309'
).each do |call|
  # print the start time for each call
  puts call.start_time
end
