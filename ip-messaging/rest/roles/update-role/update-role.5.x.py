# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the Client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = TwilioIpMessagingClient(account, token)

# Update role
service = client.services.get(sid="ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
role = service.roles.get(sid="RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
updated_role = role.update(permission=["sendMessage", "leaveChannel"])
print(updated_role)
