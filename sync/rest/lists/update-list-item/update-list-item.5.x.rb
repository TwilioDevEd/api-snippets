require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Create a Sync List Item
response = service.sync_lists('MyCollection').sync_list_items(1).update(
  data: "{ 'number': '001', 'name': 'Bulbasaur', 'attack':'185'}"
)

puts response
