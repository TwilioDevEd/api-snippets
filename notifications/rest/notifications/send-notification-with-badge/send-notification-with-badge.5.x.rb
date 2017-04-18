# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.services('ISxxx')

notification = service.notifications.create(
  identity: '00000001',
  apn: '{"aps" :'\
          '{ "alert":'\
            '{"title":"Bob alert",'\
             '"body" : "Bob, you just received a badge"},'\
          '"badge" : 1 }}'
)

puts notification
