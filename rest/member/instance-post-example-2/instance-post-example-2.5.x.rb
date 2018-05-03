# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all the members in the queue with the given sid
@member = @client.api.queues('QU5ef8732a3c49700934481addd5ce1659')
                 .members('CA5ef8732a3c49700934481addd5ce1659').fetch

@member.update(
  url: 'http://demo.twilio.com/docs/voice.xml',
  method: 'POST'
)

puts @member.position
