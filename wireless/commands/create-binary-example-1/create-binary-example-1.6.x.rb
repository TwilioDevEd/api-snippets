# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

command = client.wireless.commands.create(
  command: 'SGVsbG8sIE1hY2hpbmUh==',
  sim: 'AliceSmithSmartMeter',
  command_mode: 'binary'
)

puts command
