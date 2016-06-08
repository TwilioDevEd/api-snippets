# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

sms = @client.account.sms.messages.create(:body => "Hey Mr Nugget, you the bomb!",
    :to => "+15005550009",
    :from => "+15005550006")
puts sms.from
