# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

binding = service.bindings.create(
  identity: '00000001',
  endpoint: 'endpoint_id',
  binding_type: 'fcm',
  address: 'fcm_device_token',
  tag: 'preferred device, new user'
)

puts binding.sid
