# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

domain = client.sip.domains.get("SD27f0288630a668bdfbf177f8e22f5ccc")
print domain.voice_method
