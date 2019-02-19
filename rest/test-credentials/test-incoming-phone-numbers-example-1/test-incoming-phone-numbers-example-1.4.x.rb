# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

number = @client.account.incoming_phone_numbers
                .create(voice_url: 'http://demo.twilio.com/docs/voice.xml',
                        phone_number: '+15005550006')
puts number.sms_url
