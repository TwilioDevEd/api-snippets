# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

@summary = @client.account.calls.feedback_summary.get("FSa346467ca321c71dbd5e12f627deb854")
@summary.delete
