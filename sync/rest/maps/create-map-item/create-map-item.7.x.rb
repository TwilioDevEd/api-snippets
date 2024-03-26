require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
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
