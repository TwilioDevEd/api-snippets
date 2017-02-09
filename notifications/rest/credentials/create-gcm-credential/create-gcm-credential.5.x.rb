# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a credential for a given identity
credential = client.notify.v1.credentials.create(
  friendly_name: 'MyGCMCredential',
  type: 'gcm',
  # secret: 'gcm_api_key'
)

puts credential.sid
