require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a Map Item
response = service.sync_maps('Players').sync_map_items('steph_curry').update(
  data: "{ 'name': 'Stephen Curry', 'level': '31', 'username':'spicy_curry'}"
)
puts response
