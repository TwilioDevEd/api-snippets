require 'base64'
require 'openssl'

# Validates that incoming requests genuinely originated from Twilio
def verify_webhook(req, api_key)
  url = req.url
  method = req.method
  params = req.body.read

  # Read the nonce from the request
  nonce = req.headers['x-authy-signature-nonce']

   # Concatinate all together and separate by '|'
  data = [nonce, method, url, params].join('|')

  # Compute the signature
  digest  = OpenSSL::Digest.new('sha256')
  hmac = OpenSSL::HMAC.digest(digest, api_key, data)
  calculated_hmac = Base64.encode64().strip

  # Compare the message signature with your calculated signature
  # Continue processing the request if it's valid, return a 403 error if
  # it's not
  sig = req.headers['x-authy-signature'];
  return ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, sig)
end
