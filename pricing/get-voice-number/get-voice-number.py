# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioPricingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token = "{{ auth_token }}"
client = TwilioPricingClient(account_sid, auth_token)

number = client.voice.numbers.get("+15108675309")

print number.outbound_call_price['current_price']
