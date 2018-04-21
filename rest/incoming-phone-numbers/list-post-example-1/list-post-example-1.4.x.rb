# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

number = @client.account.incoming_phone_numbers
                .create(friendly_name: 'My Company Line',
                        voice_url: 'http://demo.twilio.com/docs/voice.xml',
                        phone_number: '+15105647903',
                        voice_method: 'GET')
puts number.sms_url
