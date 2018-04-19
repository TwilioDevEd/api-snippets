# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

call = client.calls.create(
    url="http://demo.twilio.com/docs/voice.xml",
    to="+14155551212",
    from_="+18668675310",
    method="GET",
    status_callback="https://www.myapp.com/events",
    status_callback_method="POST",
    status_events=["initiated", "ringing", "answered", "completed"],
)
print(call.sid)
