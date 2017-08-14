require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Query for a map item
items = service.sync_maps('Players').sync_map_items.stream(
  from:  'steph_curry',
  order: 'asc'
)
items.each do |map_item|
  puts map_item.key
end
