# Get the Node helper library from https://twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
client = Twilio::REST::Client.new account_sid, auth_token

service = client.preview.proxy.services.create(
  friendly_name: 'My Awesome Service',
  callback_url: 'https://www.example.com/'
)

puts service.sid
