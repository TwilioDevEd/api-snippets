# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over records and print out a property for each one
client.account.usage.records.daily.list(
  category: 'calls-inbound',
  start_date: '2012-09-01',
  end_date: '2012-09-30'
).each do |record|
  puts record.price
end
