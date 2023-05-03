require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
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
