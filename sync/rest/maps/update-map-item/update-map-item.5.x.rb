require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a Map Item
response = service.sync_maps('Players').sync_map_items('steph_curry').update(
  data: "{ 'name': 'Stephen Curry', 'level': '31', 'username':'spicy_curry'}"
)
puts response
