# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the Client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token) 

# Update role
service = client.services.get(sid="SERVICE_SID")
role = service.roles.get(sid="ROLE_SID")
updated_role = role.update(friendlyName="RoleName", permission="sendMessage", permission="leaveChannel")
print updated_role
