# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@media = @client.account.messages('MM800f449d0399ed014aae2bcc0cc2f2ec')
                .media('ME557ce644e5ab84fa21cc21112e22c485').fetch

@media.delete
