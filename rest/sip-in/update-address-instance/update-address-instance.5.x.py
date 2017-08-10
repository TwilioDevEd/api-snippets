# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

ip_address = client.sip \
    .ip_addresses("AL32a3c49700934481addd5ce1659f04d2") \
    .update("IP32a3c49700934481addd5ce1659f04d2",
            friendly_name="Orlandos Nightclub")
print(ip_address.friendly_name)
