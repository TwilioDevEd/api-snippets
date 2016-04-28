# Download the twilio-python library from twilio.com/docs/python/install
from twilio.util import RequestValidator

# Your Auth Token from twilio.com/user/account
auth_token = '12345'

validator = RequestValidator(auth_token)

url = 'https://mycompany.com/myapp.php?foo=1&bar=2'
params = {
    'CallSid': 'CA1234567890ABCDE',
    'Caller': '+14158675309',
    'Digits': '1234',
    'From': '+14158675309',
    'To': '+18005551212'
}

# The X-Twilio-Signature header attached to the request
twilio_signature = 'RSOYDt4T1cUTdK1PDd93/VVr8B8='

print validator.validate(url, params, twilio_signature)