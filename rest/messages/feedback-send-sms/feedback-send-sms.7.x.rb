# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  from: '+15017122661',
  to: '+15558675310',
  body: 'Open to confirm: http://yourserver.com/confirm?id=1234567890',
  provide_feedback: true
)
