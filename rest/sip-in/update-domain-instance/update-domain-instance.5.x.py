# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

domain = client.sip.domains.update(
    "SD32a3c49700934481addd5ce1659f04d2",
    friendly_name="Little Kevin",
    voice_method="GET"
)
print(domain.domain_name)
