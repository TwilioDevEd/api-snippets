# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.ip_messaging import TwilioIpMessagingClient

# Initialize the Client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = TwilioIpMessagingClient(account, token)

# Create role
service = client.services.get(sid="SERVICE_SID")
role = service.roles.create(
    friendly_name="new_role",
    role_type="deployment",
    permission=["createChannel", "joinChannel"]
)
print(role)
