from twilio.rest import Client

# Account SID and Auth Token are found in the console:
# twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

service = client.preview.proxy.services.create( \
    friendly_name="My Awesome Service", \
    callback_url="https://www.example.com/")

print(service.sid)
