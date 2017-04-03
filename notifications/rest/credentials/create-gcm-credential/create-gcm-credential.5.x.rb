# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, auth_token)

credential = client.notify.credentials.create(
  friendly_name: 'MyGCMCredential',
  type: 'gcm',
  api_key: 'gcm_api_key'
)

puts credential.sid
