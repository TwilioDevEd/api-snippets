require 'http'
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the service
service = client.preview.sync.services.create(friendly_name:'FRIENDLY_NAME', webhook_url:'example.com/sync')
puts service