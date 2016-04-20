# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC32a3c49700934481addd5ce1659f04d2'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

call = @client.account.calls.create(:url => "http://www.example.com/sipdial.xml",
    :to => "sip:kate@example.com",
    :from => "Jack",
    :sip_auth_password => "secret",
    :sip_auth_username => "jack")
puts call.to
