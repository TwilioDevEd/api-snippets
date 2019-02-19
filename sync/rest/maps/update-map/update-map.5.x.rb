require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a Map TTL, set to expires in 10 days
map = service.sync_maps('MyFirstList').update(ttl: 864000)

puts "SID: #{map.sid}, expires: #{map.date_expires}"
