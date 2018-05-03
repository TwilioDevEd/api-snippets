require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Retrieve the Service Instance
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

# Traverse the Sync Lists
service.sync_lists.each do |list|
  puts list.unique_name
end

# List the Sync Lists
response = service.sync_lists.list

puts response
