require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('default')

# Update the Document, data can be any JSON
response = service.documents('BoardLED').update(
  data: '{ "led": "ON" }'
)

puts response
