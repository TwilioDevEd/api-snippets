# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over caller_ids and print out a property for each one
callers = client.account.outgoing_caller_ids.list(phone_number: '+12349013030')
callers.each do |caller_id|
  puts caller_id.phone_number
end
