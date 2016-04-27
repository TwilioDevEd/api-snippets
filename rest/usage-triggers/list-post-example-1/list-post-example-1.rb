# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

trigger = @client.account.usage.triggers.create(:trigger_value => "1000",
    :usage_category => "sms",
    :callback_url => "http://www.example.com/")
puts trigger.usage_category
