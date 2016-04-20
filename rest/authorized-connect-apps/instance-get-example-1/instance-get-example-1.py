# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC81e0c32a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

authorized_app = client.authorized_connect_apps.get("CN47260e643654388faabe8aaa18ea6756")
print authorized_app.connect_app_homepage_url
