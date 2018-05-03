require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the service
service = client.sync.v1.services('default')

data = [
  '"led": "OFF"'
]

# Create the Document, data can be any JSON
response = service.documents.create(
  unique_name: 'BoardLED',
  data: "{#{data.join(',')}}"
)

puts response
