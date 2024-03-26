# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'
require 'httparty'

# Get your Auth Token from https://www.twilio.com/console
# To set up environmental variables, see http://twil.io/secure
auth_token = ENV['TWILIO_AUTH_TOKEN']
@validator = Twilio::Security::RequestValidator.new(auth_token)

url = 'https://mycompany.com/myapp'
params = {
  'CallSid' => 'CA1234567890ABCDE',
  'Caller'  => '+12349013030',
  'Digits'  => '1234',
  'From'    => '+12349013030',
  'To'      => '+18005551212'
}

def test_url(method, url, params, valid)
    if method == 'GET'
        url += '?' + URI.encode_www_form(params)
        params = {}
    end

    signature = @validator.build_signature_for(valid ? url : "http://invalid.com", params)
    headers = {'X-Twilio-Signature': signature}
    if method == 'GET'
      response = HTTParty.get(url, headers: headers)
    else
      response = HTTParty.post(url, body: params, headers: headers)
    end
    valid_str = valid ? 'valid' : 'invalid'
    puts "HTTP #{method} with #{valid_str} signature returned #{response.code}"
end

test_url('GET', url, params, true)
test_url('GET', url, params, false)
test_url('POST', url, params, true)
test_url('POST', url, params, false)