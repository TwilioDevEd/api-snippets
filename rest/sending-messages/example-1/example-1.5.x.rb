require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
  body: 'Ahoy, World!',
  to: '+15558675310',
  from: '+14158141829',
  media_url: 'http://www.example.com/cheeseburger.png'
)

puts message.sid
