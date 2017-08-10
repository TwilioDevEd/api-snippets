# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC850685e1d9b8c09dae0b938923dc0d42"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes.create(
    from_="Jack",
    to="sip:kate@example.com",
    media_url="https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf",
    sip_auth_username="jack",
    sip_auth_password="secret"
)

print(fax.sid)
