require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the service
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Create a Map Item
response = service.sync_lists('UniqueName').sync_list_items(0).fetch()
puts response