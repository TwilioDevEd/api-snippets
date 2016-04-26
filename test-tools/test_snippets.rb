require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACdc5f132a3c49700934481addd5ce1659'
auth_token = '123'
@client = Twilio::REST::Client.new account_sid, auth_token

key = @client.account.signing_key.create(friendly_name: "User Jenny")
puts key.sid
puts key.secret

# Kernel.exit(1)