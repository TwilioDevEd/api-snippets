require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.create(
  body: 'Ahoy, World!',
  to: '+15558675309',
  from: '+14158141829',
  media_url: 'http://www.example.com/hearts.png'
)

puts message.sid
