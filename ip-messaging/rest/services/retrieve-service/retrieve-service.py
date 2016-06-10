# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token) 

# Retrieve the service
service = client.services.get(sid="SERVICE_SID")
print(service)