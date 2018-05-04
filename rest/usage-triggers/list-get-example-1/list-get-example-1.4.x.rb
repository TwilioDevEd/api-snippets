# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over triggers and print out a property for each one
@client.account.usage.triggers.list(recurring: 'daily',
                                    usage_category: 'calls').each do |trigger|
  puts trigger.current_value
end
