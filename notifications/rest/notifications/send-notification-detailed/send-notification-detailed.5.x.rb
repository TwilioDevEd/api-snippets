# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve a valid notification service
service = client.notify.v1.services('ISxxx')

# Create a detailed notification
notification = service.notifications.create(
  identity: 'Bob',
  title: 'Generic loooooooong title for all Bindings',
  body: 'This is the body for all Bindings',
  gcm: '{"notification":{"tag":"MyTag"}}',
  apn: '{"aps":{"title":"Short title for Watch."}}'
)

puts notification
