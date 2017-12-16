require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Create a Map Item
response = service.sync_maps('Players').sync_map_items.create(
  key:  'steph_curry',
  data: "{ 'name': 'Stephen Curry', 'level': '30', 'username':'spicy_curry'}",
  ttl: 864000  # expires in 10 days
)

puts response
