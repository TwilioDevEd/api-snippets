# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Get all conference instances that have the `in-progress` status
# and created on `2009-07-06`
@accounts.conferences.list(
  status: 'in-progress',
  date_created: Time.parse('2009-07-06')
).each do |conference|
  # Print the status for each conference call
  puts conference.status
end
