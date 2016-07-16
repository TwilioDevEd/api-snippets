require 'http'
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.preview.sync.services('SERVICE_SID')

# Create a List
response = service.sync_lists.create(unique_name: 'MyCollection')
puts response