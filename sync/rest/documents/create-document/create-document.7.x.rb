require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

data = [
  '"date_updated": "2016-07-06T12:46:38Z"',
  '"movie_title": "On The Line"',
  '"showtimes": ' \
    '["12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z"]',
  '"starring": ["Lance Bass", "Joey Fatone"]',
  '"genre": "Romance"'
]

# Create the Document, data can be any JSON
response = service.documents.create(
  unique_name: 'MyFirstDocument',
  data: "{#{data.join(',')}}",
  ttl: 1814400  # expires in 21 days
)

puts response
