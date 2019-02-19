# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

alpha_senders = client.messaging \
                      .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                      .alpha_senders \
                      .list()

for alpha_sender in alpha_senders:
    print(alpha_sender)
