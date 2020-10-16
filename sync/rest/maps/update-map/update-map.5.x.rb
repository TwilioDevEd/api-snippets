require 'twilio-ruby'

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a Map TTL, set to expires in 10 days
map = service.sync_maps('MyFirstList').update(ttl: 864000)

puts "SID: #{map.sid}, expires: #{map.date_expires}"
