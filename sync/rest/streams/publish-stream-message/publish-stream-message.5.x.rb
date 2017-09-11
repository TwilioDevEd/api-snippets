require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Publish a Stream Message
stream_message = service.sync_streams('MyStream').stream_messages.create(
  data: "{ 'id': 'bob', 'x': 256, 'y': 42}"
)

puts stream_message.sid
