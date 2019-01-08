# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@caller_id = @client.validation_requests
                    .create(
                      friendly_name: 'My Company Line',
                      phone_number: '+12349013030'
                    )
puts @caller_id.phone_number
puts @caller_id.friendly_name
puts @caller_id.validation_code
