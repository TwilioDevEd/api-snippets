require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update the Document, data can be any JSON
response = service.documents('MyFirstDocument').update(
  data: '{ "date_updated": "2016-07-06T15:46:38Z",
      "movie_title": "On The Line",
      "showtimes": null,
      "starring": ["Lance Bass", "Joey Fatone"],
      "genre": "Romance"}'
)

puts response
