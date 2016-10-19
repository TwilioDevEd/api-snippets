# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Find all calls in progress between the given dates
@accounts.calls.list(
  status: 'in-progress',
  start_time_after: Time.parse('2009-07-04'),
  start_time_before: Time.parse('2009-07-06')
).each do |call|
  # print the recepient of each call
  puts call.to
end
