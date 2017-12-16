require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Query Sync List
items = service.sync_lists('MyCollection').sync_list_items.stream(
  from:  '10',
  order: 'asc'
)

items.each do |list_item|
  puts list_item.data
end
