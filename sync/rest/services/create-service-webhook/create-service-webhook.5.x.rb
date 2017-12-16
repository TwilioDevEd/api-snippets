require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the service
service = client.sync.v1.services.create(
  friendly_name: 'MySyncServiceInstance',
  webhook_url:   'https://example.com/sync'
)
puts service
