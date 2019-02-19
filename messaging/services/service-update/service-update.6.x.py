# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

service = client.messaging \
                .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                .update(inbound_request_url="http://www.example.com")

print(service.inbound_request_url)
