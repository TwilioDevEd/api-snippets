# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

service = client.notify.services('ISxxx')

binding = service.bindings.create(
  endpoint: 'endpoint_id',
  identity: '00000001',
  binding_type: 'gcm',
  address: 'device_token',
  tag: 'new user'
)

puts binding
