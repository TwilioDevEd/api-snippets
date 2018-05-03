require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retreive the service
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Update a List TTL, set to expires in 10 days
list = service.sync_lists('MyFirstList').update(ttl: 864000)

puts puts "SID: #{list.sid}, expires: #{list.date_expires}"
