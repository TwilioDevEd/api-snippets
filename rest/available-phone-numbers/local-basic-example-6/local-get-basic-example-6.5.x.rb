# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all available phone numbers in Great Britain which are voice enabled
@numbers = @client.account.available_phone_numbers('GB').local
                  .list(voice_enabled: 'true')

@number = @numbers[0].phone_number

@client.account.incoming_phone_numbers.create(phone_number: @number)
