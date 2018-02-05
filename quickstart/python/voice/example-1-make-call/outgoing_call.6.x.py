# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token can be found at https://www.twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

call = client.calls.create(
    to="+15558675310",
    from_="+15017122661",
    url="http://demo.twilio.com/docs/voice.xml"
)

print(call.sid)
