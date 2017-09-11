require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the Service Instance
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Traverse the sync_streams
service.sync_streams.each do |stream|
  puts "SID: #{stream.sid}, unique name: #{stream.unique_name}"
end

# List the sync_streams
response = service.sync_streams.list
puts response
