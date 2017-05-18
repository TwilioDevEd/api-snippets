# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

did_delete = client.messaging \
                   .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                   .alpha_senders(sid="AIc781610ec0b3400c9e0cab8e757da937") \
                   .delete()

print(did_delete)
