# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
apn_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fcm_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new(account_sid, apn_credential_sid, fcm_credential_sid, auth_token)

service = client.notify.services.create(
  friendly_name: 'My Awesome Service'
)

puts service.friendly_name
