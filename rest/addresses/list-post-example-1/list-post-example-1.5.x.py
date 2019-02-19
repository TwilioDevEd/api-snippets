# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

app = client.addresses.create(
    customer_name="Customer 123",
    street="1 Hasselhoff Lane",
    city="Berlin",
    region="Berlin",
    postal_code="10875",
    iso_country="DE",
    friendly_name="Billing - Customer 123",
)
print(app.sid)
