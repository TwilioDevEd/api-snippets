require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the Service Instance
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Traverse the sync_maps
service.sync_maps.each do |map|
  puts map.unique_name
end

# List the sync_maps
response = service.sync_maps.list

puts response
