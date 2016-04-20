# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC5ef8732a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.get("MM800f449d0399ed014aae2bcc0cc2f2ec")
message.redact # Deletes body field contents
puts message.body # Will be empty string
