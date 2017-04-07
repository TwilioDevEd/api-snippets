# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.account.calls.list(
  status: 'in-progress',
  start_time_after: Time.parse('2009-07-04'),
  start_time_before: Time.parse('2009-07-06')
).each do |call|
  puts call.to
end
