# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the Client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = TwilioIpMessagingClient(account, token)

# Create role
service = client.services.get(sid="ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
role = service.roles.create(
    friendly_name="new_role",
    role_type="deployment",
    permission=["createChannel", "joinChannel"]
)
print(role)
