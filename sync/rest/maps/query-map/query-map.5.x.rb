require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
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
