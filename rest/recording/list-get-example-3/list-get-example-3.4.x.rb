# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

# Loop over recordings and print out a property for each one
recordings = client.account.recordings.list("date_created>": '2009-07-06')
recordings.each do |recording|
  puts recording.call_sid
end
