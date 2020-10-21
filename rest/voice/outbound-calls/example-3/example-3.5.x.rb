# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from http://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.calls.create(
  url: 'http://demo.twilio.com/docs/voice.xml',
  to: '+14155551212',
  send_digits: '1234#',
  from: '+18668675310',
  method: 'GET'
)

puts call.start_time
