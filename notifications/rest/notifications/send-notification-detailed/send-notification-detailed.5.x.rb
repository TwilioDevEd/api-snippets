# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

notification = service.notifications.create(
  identity: '00000001',
  title: 'Generic loooooooong title for all Bindings',
  body: 'This is the body for all Bindings',
  fcm: '{"notification":{"title":"New alert","body":"Hello Bob!"}}',
  apn: '{"aps":{"alert":{"title":"New alert.","body":"Hello Bob!"}}}'
)

puts notification
