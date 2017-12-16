# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

address = client.addresses.update(
    "AD2a0747eba6abf96b7e3c3ff0b4530f6e",
    customer_name="Customer 456",
    street="2 Hasselhoff Lane"
)
print(address.customer_name)
