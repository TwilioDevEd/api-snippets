# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACdc5f132a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

key = @client.account.keys.create(friendly_name: "User Jenny")
puts key.sid
puts key.secret
