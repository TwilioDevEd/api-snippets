# Download the twilio-python library from twilio.com/docs/python/install
from twilio.util import RequestValidator

# Your Auth Token from twilio.com/user/account
auth_token = '12345'

validator = RequestValidator(auth_token)

url = 'https://mycompany.com/myapp.php?foo=1&bar=2'
params = {
    'CallSid': 'CA1234567890ABCDE',
    'Caller': '+12349013030',
    'Digits': '1234',
    'From': '+12349013030',
    'To': '+18005551212'
}

# The X-Twilio-Signature header attached to the request
twilio_signature = '0/KCTR6DLpKmkAf8muzZqo1nDgQ='

print(validator.validate(url, params, twilio_signature))
