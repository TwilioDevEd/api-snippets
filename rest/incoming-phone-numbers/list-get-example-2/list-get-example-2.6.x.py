# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of number objects with the properties described above
numbers = client.incoming_phone_numbers \
                .list(phone_number="+14158675310")

for number in numbers:
    print(number.phone_number)
