# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

domain = client.sip.domains.create(friendly_name="Scranton Office",
    voice_url="https://dundermifflin.example.com/twilio/app.php",
    auth_type="IP_ACL",
    domain_name="dunder-mifflin-scranton.sip.twilio.com")
print domain.sid
