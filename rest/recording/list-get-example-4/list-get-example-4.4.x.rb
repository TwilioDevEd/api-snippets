# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over recordings and print out a property for each one
recordings = client.account.recordings.list("date_created<": '2016-10-15',
                                            "date_created>": '2016-10-12')
recordings.each do |recording|
  puts recording.duration
end
