require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@message = @client.messages.create(
  from: '+15017122661',
  to: '+15558675310',
  body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
  media_url: 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg'
)

puts @message.subresource_uris
