# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

trigger = @client.usage.triggers.create(
  trigger_value: '1000',
  usage_category: 'sms',
  callback_url: 'http://www.example.com/'
)

puts trigger.usage_category
