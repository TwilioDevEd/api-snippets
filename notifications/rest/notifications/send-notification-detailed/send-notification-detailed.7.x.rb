# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

notification = service.notifications.create(
  identity: '00000001',
  title: 'Generic loooooooong title for all Bindings',
  body: 'This is the body for all Bindings',
  data: '{"custom_key1":"custom value 1","custom_key2":"custom value 2"}',
  fcm: '{"notification":{"title":"New alert","body":"Hello Bob!"}}',
  apn: '{"aps":{"alert":{"title":"New alert.","body":"Hello Bob!"}}}'
)

puts notification
