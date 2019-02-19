# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.account.calls.create(url: 'http://www.example.com/sipdial.xml',
                                    to: 'sip:kate@example.com',
                                    from: 'Jack',
                                    sip_auth_password: 'secret',
                                    sip_auth_username: 'jack')
puts call.to
