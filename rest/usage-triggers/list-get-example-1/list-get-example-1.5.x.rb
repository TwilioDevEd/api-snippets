# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)


# Loop over triggers and print out a property for each one
triggers = @client.usage.triggers.list(:recurring => "daily",
                                       :usage_category => "calls")

triggers.each do |trigger|
  puts trigger.current_value
end
