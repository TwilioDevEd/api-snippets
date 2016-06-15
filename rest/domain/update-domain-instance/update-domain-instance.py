# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

domain = client.sip.domains.update("SD27f0288630a668bdfbf177f8e22f5ccc", friendly_name="Scranton Office Dev",
    voice_method="GET")
print(domain.voice_method)
