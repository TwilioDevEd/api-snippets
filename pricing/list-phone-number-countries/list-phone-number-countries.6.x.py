# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

phone_number_countries = client.pricing \
                               .phone_numbers \
                               .countries \
                               .list()

for country in phone_number_countries:
    print(country.iso_country)
