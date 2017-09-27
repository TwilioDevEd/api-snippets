# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
client = Twilio::REST::Client.new(account_sid, auth_token)

call = client.api.calls('CA42ed11f93dc08b952027ffbc406d0868')
  .update(
    to: '+1562300000',
    from: '+18180000000',
    url: 'https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16',
    machine_detection: 'Enable'
  )

puts @call.to
