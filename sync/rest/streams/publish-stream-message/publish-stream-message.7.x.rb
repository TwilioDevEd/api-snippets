require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Publish a Stream Message
stream_message = service.sync_streams('MyStream').stream_messages.create(
  data: "{ 'id': 'bob', 'x': 256, 'y': 42}"
)

puts stream_message.sid
