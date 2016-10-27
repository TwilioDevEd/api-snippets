# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Get incoming phone number with given sid
@number = @accounts.incoming_phone_numbers('PN2a0747eba6abf96b7e3c3ff0b4530f6e')
                   .fetch

# Update the voice and sms urls of the selected incoming number
@number.update(
  voice_url: 'http://demo.twilio.com/docs/voice.xml',
  sms_url: 'http://demo.twilio.com/docs/sms.xml'
)

puts @number.voice_url
