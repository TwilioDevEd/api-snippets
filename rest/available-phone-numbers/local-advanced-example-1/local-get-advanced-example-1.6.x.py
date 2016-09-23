# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

numbers = client.available_phone_numbers("US") \
                .local \
                .list(near_lat_long="37.840699,-122.461853",
                      distance="50",
                      contains="555",
                      in_region="CA")

for number in numbers:
    print number.phone_number
