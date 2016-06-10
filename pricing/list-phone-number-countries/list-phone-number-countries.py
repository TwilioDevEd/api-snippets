# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioPricingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token = "{{ auth_token }}"
client = TwilioPricingClient(account_sid, auth_token)

countries = client.phone_numbers.countries.list()

for c in countries:
    print(c.iso_country)