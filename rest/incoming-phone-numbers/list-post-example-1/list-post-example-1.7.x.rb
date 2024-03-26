# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

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
