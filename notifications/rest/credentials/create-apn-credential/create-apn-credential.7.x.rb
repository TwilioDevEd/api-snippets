# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
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
