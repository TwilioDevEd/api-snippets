# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Create an incoming number record
@number = @accounts.incoming_phone_numbers
                   .create(
                     friendly_name: 'My Company Line',
                     voice_url: 'http://demo.twilio.com/docs/voice.xml',
                     phone_number: '+15105647903',
                     voice_method: 'GET'
                   )

# Print the sms url for the new number
puts @number.sms_url
