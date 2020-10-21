# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(api_key, api_secret, account_sid)

@message = @client.messages.create(
  to: '+15558675310',
  from: '+15017122661',
  body: 'Hello World!'
)

puts @message.sid
