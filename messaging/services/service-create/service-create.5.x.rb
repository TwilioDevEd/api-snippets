# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@service = @client.messaging.v1
                  .services
                  .create(
                    friendly_name: 'My First Service',
                    status_callback: 'http://requestb.in/1234abcd'
                  )

puts @service.sid
