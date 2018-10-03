# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

number = client.pricing.v2 \
               .voice \
               .numbers(destination_number="+15108675310") \
               .fetch()

print(number.outbound_call_prices['current_price'])
