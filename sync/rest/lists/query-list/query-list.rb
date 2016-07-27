require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Query Sync List
items = service.sync_lists('MyCollection').sync_list_items.stream(
	from: '10',
	directions: 'forward'
)
items.each do |listItem|
	puts listItem.data
end