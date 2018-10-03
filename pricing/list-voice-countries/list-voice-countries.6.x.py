# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

voice_countries = client.pricing.v2 \
                        .voice \
                        .countries \
                        .list()

for country in voice_countries:
    print(country.iso_country)
