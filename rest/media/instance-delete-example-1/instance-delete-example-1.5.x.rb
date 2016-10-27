# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Get media with given sid for the given message
@media = @accounts.messages('MM800f449d0399ed014aae2bcc0cc2f2ec')
                .media('ME557ce644e5ab84fa21cc21112e22c485').fetch

# Delete the media item
# @media.delete
