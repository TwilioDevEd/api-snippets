require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update the Document, data can be any JSON
response = service.documents('MyFirstDocument').update(
  data: '{ "date_updated": "2016-07-06T15:46:38Z",
      "movie_title": "On The Line",
      "showtimes": null,
      "starring": ["Lance Bass", "Joey Fatone"],
      "genre": "Romance"}'
)

puts response
