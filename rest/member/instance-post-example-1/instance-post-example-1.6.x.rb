# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@member = @client.api.queues('QU5ef8732a3c49700934481addd5ce1659')
                 .members('Front').fetch
@member.update(
  url: 'http://demo.twilio.com/docs/voice.xml',
  method: 'POST'
)

puts @member.wait_time
