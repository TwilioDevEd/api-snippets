# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

domain = client.sip.domains.create(
    friendly_name="My Domain",
    voice_url="https://demo.twilio.com/welcome",
    auth_type="IP_ACL",
    domain_name="marlo.sip.twilio.com"
)
print(domain.sid)
