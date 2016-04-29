# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

call = @client.account.calls.create(:url => "http://demo.twilio.com/docs/voice.xml",
    :to => "+12014845141",
    :from => "+12017787677")
puts call.to
