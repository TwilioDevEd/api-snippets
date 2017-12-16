# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
certificate_from_file = 'certificate_contents'
private_key_from_file = 'private_key_contents'

client = Twilio::REST::Client.new(account_sid, auth_token)

credential = client.notify.v1.credentials.create(
  friendly_name: 'MyAPNCredential',
  type: 'apn',
  sandbox: true,
  certificate: certificate_from_file,
  private_key: private_key_from_file
)

puts credential.friendly_name
