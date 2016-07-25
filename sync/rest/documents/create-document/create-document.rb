require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the service
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Create the Document, data can be any JSON
response = service.documents.create(
  unique_name: "TEST_DOCUMENT", 
  data: '{ "date_updated": "2016-07-06T12:46:38Z",
      "movie_title": "On The Line",
      "showtimes": ["12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z"],
      "starring": ["Lance Bass", "Joey Fatone"],
      "genre": "Romance"}'
)
puts response