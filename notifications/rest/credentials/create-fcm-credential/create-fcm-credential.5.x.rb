# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

credential = client.notify.v1.credentials.create(
  friendly_name: 'MyGCMCredential',
  type: 'fcm',
  api_key: 'fcm_secret'
)

puts credential.sid
