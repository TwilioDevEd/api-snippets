# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC5ef8732a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

call = client.calls.create(url="http://demo.twilio.com/docs/voice.xml",
    to="+14155551212",
    send_digits="1234#",
    from_="+18668675309",
    method="GET")
print call.sid
