require 'http'
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.preview.sync.services('SERVICE_SID')

# Update a Map Item
response = service.sync_maps('Players').sync_map_items.update(key:'steph_curry', data: "{ 'name': 'Stephen Curry', 'level': '31', 'username':'spicy_curry'}")
puts response