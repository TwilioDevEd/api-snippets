require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the service
service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Delete a List
response = service.sync_lists('MyCollection').delete

puts response
