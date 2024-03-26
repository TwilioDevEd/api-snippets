# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
apn_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fcm_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = ENV['TWILIO_AUTH_TOKEN']

client = Twilio::REST::Client.new(account_sid, auth_token)

service = client.notify.v1.services.create(
  friendly_name: 'My Awesome Service',
  apn_credential_sid: apn_credential_sid,
  fcm_credential_sid: fcm_credential_sid
)

puts service.friendly_name
