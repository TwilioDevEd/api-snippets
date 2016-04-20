# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC5ef877a5fe4238be081ea6f3c44186f3'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token


# Loop over calls and print out a property for each one
@client.account.calls.list.each do |call|
    puts call.direction
end
