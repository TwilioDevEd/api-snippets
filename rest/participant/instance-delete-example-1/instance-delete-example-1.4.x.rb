# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

participant = client.account
                    .conferences.get('CFbbe4632a3c49700934481addd5ce1659')
                    .participants.get('CA386025c9bf5d6052a1d1ea42b4d16662')
participant.delete
