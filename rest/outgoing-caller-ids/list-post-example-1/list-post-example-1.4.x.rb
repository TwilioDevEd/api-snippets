# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

caller_id = @client.account.outgoing_caller_ids.create(
  friendly_name: 'My Home Phone Number',
  phone_number: '+12349013030'
)
puts caller_id.phone_number
