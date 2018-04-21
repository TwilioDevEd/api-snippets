# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

media = client.messages
              .get('MM800f449d0399ed014aae2bcc0cc2f2ec')
              .media
              .get('ME557ce644e5ab84fa21cc21112e22c485')
media.delete
