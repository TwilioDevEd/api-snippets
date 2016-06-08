# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

message = client.messages.create(body="Jenny please?! I love you <3",
    to="+15558675309",
    from_="+14158141829",
    media_url="http://www.example.com/hearts.png")
print message.sid
