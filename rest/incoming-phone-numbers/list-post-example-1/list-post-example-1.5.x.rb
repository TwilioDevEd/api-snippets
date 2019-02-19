# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@number = @client.incoming_phone_numbers
                 .create(
                   friendly_name: 'My Company Line',
                   voice_url: 'http://demo.twilio.com/docs/voice.xml',
                   phone_number: '+15105647903',
                   voice_method: 'GET'
                 )

puts @number.sms_url
