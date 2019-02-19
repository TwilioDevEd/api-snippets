require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a Map TTL, set to expires in 10 days
stream = service.sync_streams('MyStream').update(ttl: 864000)

puts "SID: #{stream.sid}, expires: #{stream.date_expires}"
