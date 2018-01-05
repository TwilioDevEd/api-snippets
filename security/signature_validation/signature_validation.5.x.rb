# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Auth Token from https://www.twilio.com/console
auth_token = 'your_auth_token'
validator = Twilio::Security::RequestValidator.new(auth_token)

url = 'https://mycompany.com/myapp.php?foo=1&bar=2'
params = {
  'CallSid' => 'CA1234567890ABCDE',
  'Caller'  => '+14158675310',
  'Digits'  => '1234',
  'From'    => '+14158675310',
  'To'      => '+18005551212'
}
# The X-Twilio-Signature header attached to the request
twilio_signature = 'RSOYDt4T1cUTdK1PDd93/VVr8B8='

print(validator.validate(url, params, twilio_signature))
