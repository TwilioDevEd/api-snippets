# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Auth Token from https://www.twilio.com/console
auth_token = ENV['TWILIO_AUTH_TOKEN']

#  Initialize the request validator
validator = Twilio::Security::RequestValidator.new(auth_token)

# Store Twilio's request URL (the url of your webhook) as a variable
url = 'https://example.com/myapp'

# Store the application/x-www-form-urlencoded params from Twilio's request as a variable
# In practice, this MUST include all received parameters, not a
# hardcoded list of parameters that you receive today. New parameters
# may be added without notice.
params = {
  'CallSid' => 'CA1234567890ABCDE',
  'Caller'  => '+12349013030',
  'Digits'  => '1234',
  'From'    => '+12349013030',
  'To'      => '+18005551212'
}

# Store the X-Twilio-Signature header attached to the request as a variable
twilio_signature = 'Np1nax6uFoY6qpfT5l9jWwJeit0='

# Check if the incoming signature is valid for your application URL and the incoming parameters
puts validator.validate(url, params, twilio_signature)
