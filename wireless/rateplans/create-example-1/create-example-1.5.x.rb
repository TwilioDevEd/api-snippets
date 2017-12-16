# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

rate_plan = client.wireless.rate_plans
                  .create(
                    unique_name: 'SmartMeterCA',
                    friendly_name: 'California SmartMeter Plan',
                    data_limit: 5,
                    messaging_enabled: true
                  )

puts rate_plan
